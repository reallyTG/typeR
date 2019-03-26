library(CDECRetrieve)


### Name: map_stations
### Title: Map Station Search
### Aliases: map_stations

### ** Examples

if (interactive()) {
    cdec_stations(county = "alameda") %>% map_stations(label=~name, popup=~station_id)
}



