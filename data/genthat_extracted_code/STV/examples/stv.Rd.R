library(STV)


### Name: stv
### Title: Implement STV Counting Systems
### Aliases: stv

### ** Examples

data(ballots)
cballots <- cleanBallots(ballots)

set.seed(1)
result1 <- stv(cballots, seats = 4)
names(result1)
result1$elected

set.seed(4)
result2 <- stv(cballots, seats = 4)
result2$elected

## Not run: 
##D result3 <- stv(cballots, seats = 4, surplusMethod = "Fractional")
##D result3$elected
##D 
##D result4 <- stv(cballots, seats = 4, surplusMethod = "Fractional",
##D                quotaMethod = "Hare")
##D result4$elected
##D 
##D result5 <- stv(cballots, seats = 4, surplusMethod = "Cambridge",
##D                quotaMethod = "Hare")
##D result5$elected
## End(Not run)




