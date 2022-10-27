//
//  ScheduleDetailsView.swift
//  movielia
//
//  Created by Laura on 26.10.2022..
//

import SwiftUI

struct ScheduleDetailsView: View {
    
    var schedule: ScheduleResponse      
    var cast: [CastResponse]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    AsyncImage(url: schedule.show.image?.original) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height / 1.9)
                            .ignoresSafeArea()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(width: geo.size.width, height: geo.size.height / 1.58)
                    }
                    
                    Text(schedule.show.summary ?? "Summary not available.")
                        .foregroundColor(Color.primaryLightGray)
                        .padding(.horizontal, 4)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Text("Cast")
                            .foregroundColor(Color.primaryLightGray)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button {
                            // show all cast
                        } label: {
                            Text("show all")
                                .foregroundColor(Color.primaryYellow)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            ForEach(cast.prefix(10), id: \.person?.id) { person in
                                CastCardView(person: person)
                            }
                        }
                    }
                }
            }
        }
        .background(Color.primaryBlack)
    }
}
