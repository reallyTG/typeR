library(ndl)


### Name: plot.RescorlaWagner
### Title: Plot function for the output of 'RescorlaWagner'.
### Aliases: plot.RescorlaWagner
### Keywords: classif

### ** Examples


data(lexample)
lexample$Cues <- orthoCoding(lexample$Word, grams=1)
lexample.rw <- RescorlaWagner(lexample, nruns=25, 
   traceCue="h", traceOutcome="hand")
plot(lexample.rw)
mtext("h - hand", 3, 1)

# Full example

## Not run: 
##D par(mfrow=c(2,2))
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, 
##D    traceCue="h", traceOutcome="hand")
##D plot(lexample.rw)
##D mtext("h - hand", 3, 1)
##D 
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, 
##D    traceCue="s", traceOutcome="plural")
##D plot(lexample.rw)
##D mtext("s - plural", 3, 1)
##D 
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, 
##D    traceCue="a", traceOutcome="as")
##D plot(lexample.rw)
##D mtext("a - as", 3, 1)
##D 
##D lexample.rw <- RescorlaWagner(lexample, nruns=25, 
##D    traceCue="s", traceOutcome="as")
##D plot(lexample.rw)
##D mtext("s - as", 3, 1)
##D par(mfrow=c(1,1))
## End(Not run)



