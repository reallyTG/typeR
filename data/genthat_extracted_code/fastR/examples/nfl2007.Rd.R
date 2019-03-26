library(fastR)


### Name: nfl2007
### Title: NFL 2007 season
### Aliases: nfl2007
### Keywords: datasets

### ** Examples


data(nfl2007); nfl <- nfl2007
nfl$dscore <- nfl$HomeScore - nfl$VisitorScore 
w <- which(nfl$dscore > 0) 
nfl$winner <- nfl$Visitor; nfl$winner[w] <- nfl$Home[w] 
nfl$loser <- nfl$Home; nfl$loser[w] <- nfl$Visitor[w] 
# did the home team win? 
nfl$homeTeamWon <- nfl$dscore > 0 
table(nfl$homeTeamWon)
table(nfl$dscore > nfl$line)




