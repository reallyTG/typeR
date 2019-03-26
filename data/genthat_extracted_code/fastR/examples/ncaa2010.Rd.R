library(fastR)


### Name: ncaa2010
### Title: NCAA Division I Basketball Results
### Aliases: ncaa2010 ncaa2009 ncaa2008
### Keywords: datasets

### ** Examples


data(ncaa2010)
# add some additional variables to the data frame
ncaa2010$dscore <- ncaa2010$hscore- ncaa2010$ascore
ncaa2010$homeTeamWon <- ncaa2010$dscore > 0
ncaa2010$numHomeTeamWon <- -1 + 2 * as.numeric(ncaa2010$homeTeamWon)
w <- which(ncaa2010$homeTeamWon)
ncaa2010$winner <- as.character(ncaa2010$away)
ncaa2010$winner[w] <- as.character(ncaa2010$home)[w]
ncaa2010$loser <- as.character(ncaa2010$home)
ncaa2010$loser[w] <- as.character(ncaa2010$away)[w]
ncaa2010$homeTeamWon <- ncaa2010$winner == ncaa2010$home
ncaa2010$numHomeTeamWon <- -1 + 2 * as.numeric(ncaa2010$homeTeamWon)




