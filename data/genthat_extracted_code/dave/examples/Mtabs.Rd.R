library(dave)


### Name: Mtabs
### Title: Structuring vegetation data tables
### Aliases: Mtabs Mtabs.default summary.Mtabs plot.Mtabs mtab plottab
###   plottabl setgroupsize
### Keywords: multivariate array

### ** Examples

y.r<- 0.5 ; y.s<- 0.2                 # defining transformations used
k.r <- 3 ; k.s <- 4                   # row- and column numbers
ndiffs <- 18                          # no. of columns used to show pattern
o.Mt<-Mtabs(nveg,"mulva" ,y.r,y.s,k.r,k.s,ndiffs)
plot(o.Mt,method="normal")
# to see the original order simply replace "mulva" by "raw"



