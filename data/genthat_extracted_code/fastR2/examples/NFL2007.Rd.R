library(fastR2)


### Name: NFL2007
### Title: NFL 2007 season
### Aliases: NFL2007
### Keywords: datasets

### ** Examples


data(NFL2007) 
NFL <- NFL2007 
NFL$dscore <- NFL$homeScore - NFL$visitorScore 
w <- which(NFL$dscore > 0) 
NFL$winner <- NFL$visitor; NFL$winner[w] <- NFL$home[w] 
NFL$loser <- NFL$home; NFL$loser[w] <- NFL$visitor[w] 
# did the home team win? 
NFL$homeTeamWon <- NFL$dscore > 0 
table(NFL$homeTeamWon)
table(NFL$dscore > NFL$line)




