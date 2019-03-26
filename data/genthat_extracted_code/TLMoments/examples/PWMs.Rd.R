library(TLMoments)


### Name: PWMs
### Title: Probability weighted moments
### Aliases: PWMs PWMs.numeric PWMs.matrix PWMs.list PWMs.data.frame
###   PWMs.TLMoments

### ** Examples

# Generating data sets:
xmat <- matrix(rnorm(100), nc = 4)
xvec <- xmat[, 3]
xlist <- lapply(1L:ncol(xmat), function(i) xmat[, i])
xdat <- data.frame(
 station = rep(letters[1:2], each = 50),
 season = rep(c("S", "W"), 50),
 hq = as.vector(xmat)
)

# Calculating PWMs from data:
PWMs(xvec)
PWMs(xmat)
PWMs(xlist)
PWMs(xdat, formula = hq ~ station)
PWMs(xdat, formula = hq ~ season)
PWMs(xdat, formula = hq ~ .)
PWMs(xdat, formula = . ~ station + season)

# Calculating PWMs from L-moments:
PWMs(TLMoments(xvec))
PWMs(TLMoments(xmat))
PWMs(TLMoments(xlist))
PWMs(TLMoments(xdat, hq ~ station))
PWMs(TLMoments(xdat, hq ~ season))
PWMs(TLMoments(xdat, hq ~ .))
PWMs(TLMoments(xdat, . ~ station + season))

# In data.frame-mode invalid names are preceded by "."
xdat <- data.frame(
 beta0 = rep(letters[1:2], each = 50),
 beta1 = as.vector(xmat)
)
PWMs(xdat, formula = beta1 ~ beta0)




