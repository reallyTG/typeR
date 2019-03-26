library(nontarget)


### Name: plotdiff
### Title: Filtering important m/z differences among peaks of a HRMS data
###   set.
### Aliases: plotdiff

### ** Examples

## No test: 
data(peaklist)
diffs<-plotdiff(peaklist, histbreaks = 10000, rttol = c(0, 0), mztol = c(0, 100), plotit = TRUE)
## End(No test)



