library(NMAoutlier)


### Name: Schoenberg2013
### Title: Network meta-analysis comparing the effects after Laparoscopic
###   Heller myotomy
### Aliases: Schoenberg2013
### Keywords: datasets

### ** Examples

data(Schoenberg2013)
## No test: 
# Conduct forward search algorithm for the network of Laparoscopic
# Heller myotomy
#
FSresult <- NMAoutlier(logOR, selogOR, t1, t2, id, data = Schoenberg2013)

# Draw forward plot for z-values from difference of direct and
# indirect evidence
#
fwdplot(FSresult, "nsplit")
## End(No test)



