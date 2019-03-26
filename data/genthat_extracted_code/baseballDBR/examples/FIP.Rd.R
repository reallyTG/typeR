library(baseballDBR)


### Name: FIP
### Title: Pitching: Fielding Independent Pitching (FIP)
### Aliases: FIP
### Keywords: FIP fielding independent pitching

### ** Examples


data("Pitching2016")
head(Pitching2016)

Pitching2016$FIP <- FIP(Pitching2016, Fangraphs=FALSE, NA_to_zero=TRUE, Sep.Leagues=FALSE)




