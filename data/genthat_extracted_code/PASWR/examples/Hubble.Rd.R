library(PASWR)


### Name: Hubble
### Title: Hubble Telescope
### Aliases: Hubble
### Keywords: datasets

### ** Examples

with(data = Hubble, 
qqnorm(Team1 - Team2))
with(data = Hubble, 
qqline(Team1 - Team2))
# Trellis Approach
qqmath(~(Team1 - Team2), data = Hubble, type=c("p","r"))



