library(ecospat)


### Name: ecospat.cv.rf
### Title: RandomForest Cross Validation
### Aliases: ecospat.cv.rf

### ** Examples

## Not run: 
##D ecospat.cv.example() #generates data
##D rf <- ecospat.cv.rf(get("glm.Achillea_atrata", envir = ecospat.env), 
##D ecospat.testData[, c(53, 4:8)], K = 10, cv.lim = 10, jack.knife = FALSE)
## End(Not run)



