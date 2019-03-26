library(baseballDBR)


### Name: BABIP
### Title: Batting: Calculate batting average on balls in play (BABIP)
### Aliases: BABIP
### Keywords: BABIP ball base bb on percentage

### ** Examples


data("Batting2016")
head(Batting2016)

Batting2016$BABIP <- BABIP(Batting2016)




