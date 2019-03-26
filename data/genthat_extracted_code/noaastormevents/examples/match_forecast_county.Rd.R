library(noaastormevents)


### Name: match_forecast_county
### Title: Match events by forecast zone to county
### Aliases: match_forecast_county

### ** Examples

counties_to_parse <- dplyr::data_frame(
           event_id = c(1:19),
           cz_name = c("Suffolk",
                       "Eastern Greenbrier",
                       "Ventura County Mountains",
                       "Central And Southeast Montgomery",
                       "Western Cape May",
                       "San Diego County Coastal Areas",
                       "Blount/Smoky Mountains",
                       "St. Mary's",
                       "Central & Eastern Lake County",
                       "Mountains Southwest Shasta County To Northern Lake County",
                       "Kings (Brooklyn)",
                       "Lower Bucks",
                       "Central St. Louis",
                       "Curry County Coast",
                       "Lincoln County Except The Sheep Range",
                       "Shasta Lake/North Shasta County",
                       "Coastal Palm Beach County",
                       "Larimer & Boulder Counties Between 6000 & 9000 Feet",
                       "Yellowstone National Park"),
          state = c("Virginia",
                    "West Virginia",
                    "California",
                    "Maryland",
                    "New Jersey",
                    "California",
                    "Tennessee",
                    "Maryland",
                    "Oregon",
                    "California",
                    "New York",
                    "Pennsylvania",
                    "Minnesota",
                    "Oregon",
                    "Nevada",
                    "California",
                    "Florida",
                    "Colorado",
                    "Wyoming"))
match_forecast_county(counties_to_parse)



