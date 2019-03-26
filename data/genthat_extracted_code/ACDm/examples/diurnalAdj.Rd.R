library(ACDm)


### Name: diurnalAdj
### Title: Dirunal adjustment for durations
### Aliases: diurnalAdj

### ** Examples

diurnalAdj(durData, aggregation = "none", method = "supsmu")

## Not run: 
##D 
##D head(durData)
##D f <- diurnalAdj(durData, aggregation = "weekdays", method = "FFF", Q = 3)
##D head(f)
##D 
##D f <- diurnalAdj(durData, aggregation = "all", returnSplineFnc = TRUE)
##D f
## End(Not run)



