library(dplR)


### Name: rwl.report
### Title: Do some reporting on a RWL object
### Aliases: rwl.report
### Keywords: manip

### ** Examples

data("gp.rwl")
rwl.report(rwl = gp.rwl)
# list very small (smallest 1pct) of rings as well
one.pct <- quantile(gp.rwl[gp.rwl != 0], na.rm=TRUE, probs=0.01)
rwl.report(rwl = gp.rwl, small.thresh = one.pct)



