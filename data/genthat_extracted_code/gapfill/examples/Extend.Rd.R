library(gapfill)


### Name: Extend
### Title: Implement an Alternative Gap-fill Algorithm
### Aliases: Extend extend alternative

### ** Examples

## Not run: 
##D ## Example 1: mean ----------------------------------
##D ## define a predict function
##D PredictMean <- function (a, i) mean(a, na.rm = TRUE)
##D 
##D out1 <- Gapfill(data = ndvi, fnPredict = PredictMean)
##D Image(out1$fill)
##D 
##D ## start with a smaller subset
##D args(Subset)
##D out2 <- Gapfill(data = ndvi, fnPredict = PredictMean,
##D                 initialSize = c(0, 0, 1, 6))
##D Image(out2$fill)
##D 
##D ## require at least "nNotNA" non-NA values
##D ## return predicted value and number of iterations i
##D PredictMean2 <- function (a, i, nNotNA) {
##D     if (sum(!is.na(a)) < nNotNA)
##D         return (c(NA, NA))
##D     c(mean(a, na.rm = TRUE), i)
##D }
##D out3 <- Gapfill(data = ndvi, fnPredict = PredictMean2, nPredict = 2,
##D                 initialSize = c(0, 0, 1, 6), nNotNA = 0)
##D stopifnot(identical(c(out2$fill), c(out3$fill[,,,,1])))
##D Image(out3$fill[,,,,2])  # number of used iterations i
##D 
##D out4 <- Gapfill(data = ndvi, fnPredict = PredictMean2, nPredict = 2,
##D                 initialSize = c(0, 0, 1, 6), nNotNA = 50)
##D Image(out4$fill[,,,,1])  # fill values
##D Image(out4$fill[,,,,2])  # number of used iterations i
##D 
##D 
##D ## Example 2: Score() and lm() ----------------------
##D PredictLm <- function (a, i, nNotNA = 50, minScores = 2){
##D     if (sum(!is.na(a)) < nNotNA)
##D         return (NA)
##D     am <- Array2Matrix(a)
##D     sx <- Score(t(am))
##D     lsx <- length(sx)
##D     if (lsx < minScores)
##D         return (NA)
##D     sy <- Score(am)
##D     lsy <- unique(length(sy))
##D     if (lsy < minScores)
##D         return (NA)
##D     df <- data.frame(z = c(am),
##D                      sx = rep(sx, ncol(am)),
##D                      sy = rep(sy, each = nrow(am)))
##D     newdata <- df[IndexTwoOne(attr(am, "mp"), dim(am)),]
##D     m <- lm(z ~ sx * sy, data = df)
##D     predict(m, newdata = newdata)
##D }
##D 
##D ## test PredictLm() by running it
##D ## manually for one missing value
##D mp <- IndexOneFour(which(is.na(ndvi))[1], dim(ndvi))
##D a <- Subset(data = ndvi, mp = mp, i = 0)
##D PredictLm(a = a, i = 0)
##D 
##D ## run PredictLm() on ndvi data
##D out5 <- Gapfill(data = ndvi, fnPredict = PredictLm,
##D                 nNotNA = 50)
##D Image(out5$fill)
## End(Not run)



