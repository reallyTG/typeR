library(ndl)


### Name: lexample
### Title: Lexical example data illustrating the Rescorla-Wagner equations
### Aliases: lexample
### Keywords: datasets

### ** Examples

## Not run: 
##D data(lexample)
##D lexample$Cues <- orthoCoding(lexample$Word, grams=1)
##D par(mfrow=c(2,2))
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, traceCue="h",traceOutcome="hand")
##D plot(lexample.rw)
##D mtext("h - hand", 3, 1)
##D 
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, traceCue="s",traceOutcome="plural")
##D plot(lexample.rw)
##D mtext("s - plural", 3, 1)
##D 
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, traceCue="a",traceOutcome="as")
##D plot(lexample.rw)
##D mtext("a - as", 3, 1)
##D 
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, traceCue="s",traceOutcome="as")
##D plot(lexample.rw)
##D mtext("s - as", 3, 1)
##D par(mfrow=c(1,1))
## End(Not run)



