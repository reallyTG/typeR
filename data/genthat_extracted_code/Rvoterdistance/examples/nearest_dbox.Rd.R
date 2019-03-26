library(Rvoterdistance)


### Name: nearest_dbox
### Title: Calculates nearest drop box or polling location
### Aliases: nearest_dbox

### ** Examples

data(king_dbox)
# Haversine distance between voter and drop boxes, King County
hav_calc <- nearest_dbox (king_geo$Residence_Addresses_Latitude, 
king_geo$Residence_Addresses_Longitude, 
dbox$lat, dbox$long)

summary(hav_calc)

data(meck_ev)
# Voter and early vote location, Mecklenburg County
hav_meck <- nearest_dbox (voter_meck$lat, voter_meck$long,
				early_meck$lat, early_meck$long)
summary(hav_meck)




