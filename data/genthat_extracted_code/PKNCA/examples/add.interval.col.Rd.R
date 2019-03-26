library(PKNCA)


### Name: add.interval.col
### Title: Add columns for calculations within PKNCA intervals
### Aliases: add.interval.col

### ** Examples

## Not run: 
##D add.interval.col("cmax",
##D                  FUN="pk.calc.cmax",
##D                  values=c(FALSE, TRUE),
##D                  desc="Maximum observed concentration",
##D                  depends=c())
##D add.interval.col("cmax.dn",
##D                  FUN="pk.calc.dn",
##D                  values=c(FALSE, TRUE),
##D                  desc="Maximum observed concentration, dose normalized",
##D                  formalsmap=list(parameter="cmax"),
##D                  depends=c("cmax"))
## End(Not run)



