library(PASWR2)


### Name: HUBBLE
### Title: Hubble Telescope
### Aliases: HUBBLE
### Keywords: datasets

### ** Examples

with(data = HUBBLE, 
qqnorm(team1 - team2))
with(data = HUBBLE, 
qqline(team1 - team2))
# Trellis Approach
qqmath(~(team1 - team2), data = HUBBLE, type=c("p", "r"))
# ggplot approach
ggplot(data = HUBBLE, aes(sample = team1 - team2)) + stat_qq(color = "blue")



