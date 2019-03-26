library(baseballDBR)


### Name: wRC
### Title: Batting: Calculate Weighted Runs Created (wRC)
### Aliases: wRC
### Keywords: Above Average Runs Weighted wRC

### ** Examples


data("Batting2016")
head(Batting2016)
data("Pitching2016")
head(Pitching2016)
data("Fielding2016")
head(Fielding2016)

Batting2016$wRC <- wRC(Batting2016, Pitching2016, Fielding2016, Fangraphs=FALSE,
                         NA_to_zero=TRUE, Sep.Leagues=FALSE)




