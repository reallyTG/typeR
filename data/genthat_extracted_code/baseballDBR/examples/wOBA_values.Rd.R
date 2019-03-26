library(baseballDBR)


### Name: wOBA_values
### Title: Return wOBA values per season
### Aliases: wOBA_values
### Keywords: average, base fangraphs on wOBA, woba,

### ** Examples


data("Batting2016")
head(Batting2016)
data("Pitching2016")
head(Pitching2016)
data("Fielding2016")
head(Fielding2016)

woba_df <- wOBA_values(Batting2016, Pitching2016, Fielding2016, Sep.Leagues=FALSE, Fangraphs=FALSE)




