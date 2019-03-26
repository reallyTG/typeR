library(spatstat)


### Name: subset.ppp
### Title: Subset of Point Pattern Satisfying A Condition
### Aliases: subset.ppp subset.pp3 subset.lpp subset.ppx
### Keywords: spatial manip

### ** Examples

 plot(subset(cells, x > 0.5))

 subset(amacrine, marks == "on")

 subset(amacrine, marks == "on", drop=TRUE)

 subset(redwood, nndist(redwood) > 0.04)

 subset(finpines, select=height)

 subset(finpines, diameter > 2, height)

 subset(nbfires, year==1999 & ign.src == "campfire",
                 select=cause:fnl.size)

 v <- subset(chicago, x + y > 1100 & marks == "assault")

 vv <- subset(chicago, x + y > 1100 & marks == "assault", drop=TRUE)

 a <- subset(rpoispp3(40), z > 0.5)



