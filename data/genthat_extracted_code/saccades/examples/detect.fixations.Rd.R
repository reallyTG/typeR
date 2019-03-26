library(saccades)


### Name: detect.fixations
### Title: Detect Fixations in a Stream of Raw Eye-Tracking Samples
### Aliases: detect.fixations
### Keywords: classif manip ts

### ** Examples

data(samples)
head(samples)
fixations <- detect.fixations(samples)
head(fixations)
## Not run: 
##D first.trial <- samples$trial[1]
##D first.trial.samples <- subset(samples, trial==first.trial)
##D first.trial.fixations <- subset(fixations, trial==first.trial)
##D with(first.trial.samples, plot(x, y, pch=20, cex=0.2, col="red"))
##D with(first.trial.fixations, points(x, y, cex=1+sqrt(dur/10000)))
## End(Not run)



