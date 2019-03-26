library(Rvoterdistance)


### Name: smorgesboard
### Title: Calculates nearest drop box or polling location, Smorgesboard
###   back
### Aliases: smorgesboard

### ** Examples


data(meck_ev)
str(voter_meck)
str(early_meck)

# Grab smorgesboard of distance information from polling location
vote_distance <- smorgesboard(voter_meck, early_meck[,-1], c("lat", "long"), c("lat", "long"))
head(vote_distance)




