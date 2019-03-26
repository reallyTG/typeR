library(languageR)


### Name: lags.fnc
### Title: Calculate vector at specified lag
### Aliases: lags.fnc
### Keywords: autocorrelation lag

### ** Examples
## Not run: 
##D   dfr = data.frame(Subject=c(rep("a", 5), rep("b", 5)),
##D                    Trial = c(rep(1:5,2)),
##D                    RT = rnorm(10, 500, 40))
##D   dfr$prevRT = lag.fnc(dfr, time="Trial", group="Subject", depvar="RT")
##D   dfr
##D 
## End(Not run)


