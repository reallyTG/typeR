library(baseballDBR)


### Name: wOBA
### Title: Batting: Calculate Weighted On-Base Average (wOBA)
### Aliases: wOBA
### Keywords: Average On-Base Weighted wOBA

### ** Examples


data("Batting2016")
head(Batting2016)
data("Pitching2016")
head(Pitching2016)
data("Fielding2016")
head(Fielding2016)

Batting2016$wOBA <- wOBA(Batting2016, Pitching2016, Fielding2016, Fangraphs=FALSE,
                          NA_to_zero=TRUE, Sep.Leagues=FALSE)




