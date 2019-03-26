library(Rvoterdistance)


### Name: dist_mile
### Title: Calculates nearest drop box or polling location, in miles
### Aliases: dist_mile

### ** Examples


data(meck_ev)
# Voter and early vote location, Mecklenburg County
hav_meck <- nearest_dbox (voter_meck$lat, voter_meck$long,
				early_meck$lat, early_meck$long)
summary(hav_meck)
hav_mile <- dist_mile(num_vec=hav_meck, vec_only=TRUE)
head(hav_mile)

# Calculate mile distance directly
have_mile2 <- dist_mile (voter_meck$lat, voter_meck$long,
				early_meck$lat, early_meck$long)
head(have_mile2)




