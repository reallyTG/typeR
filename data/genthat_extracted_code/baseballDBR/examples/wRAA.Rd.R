library(baseballDBR)


### Name: wRAA
### Title: Batting: Calculate Weighted Runs Above Average (wRAA)
### Aliases: wRAA
### Keywords: Above Average Runs Weighted wRAA

### ** Examples


data("Batting2016")
head(Batting2016)
data("Pitching2016")
head(Pitching2016)
data("Fielding2016")
head(Fielding2016)

Batting2016$wRAA <- wRAA(Batting2016, Pitching2016, Fielding2016, Fangraphs=FALSE,
                          NA_to_zero=TRUE, Sep.Leagues=FALSE)




