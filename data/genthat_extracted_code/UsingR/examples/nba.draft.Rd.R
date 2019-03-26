library(UsingR)


### Name: nba.draft
### Title: NBA draft lottery odds for 2002
### Aliases: nba.draft
### Keywords: datasets

### ** Examples

data(nba.draft)
top.pick = sample(row.names(nba.draft),1,prob = nba.draft$Balls)



