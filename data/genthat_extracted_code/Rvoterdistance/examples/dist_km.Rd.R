library(Rvoterdistance)


### Name: dist_km
### Title: Calculates nearest drop box or polling location, in kilometers
### Aliases: dist_km

### ** Examples


data(meck_ev)
# Voter and early vote location, Mecklenburg County
hav_meck <- nearest_dbox (voter_meck$lat, voter_meck$long,
				early_meck$lat, early_meck$long)
summary(hav_meck)
hav_km <- dist_km(num_vec=hav_meck, vec_only=TRUE)
head(hav_km)

# Calculate mile distance directly
have_km2 <- dist_km (voter_meck$lat, voter_meck$long,
				early_meck$lat, early_meck$long)
head(have_km2)




