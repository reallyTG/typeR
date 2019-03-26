library(NCmisc)


### Name: NCmisc-package
### Title: Miscellaneous Functions for Creating Adaptive Functions and
###   Scripts
### Aliases: NCmisc-package NCmisc
### Keywords: iteration color utilities package

### ** Examples

#text histogram suited to working from a console without GUI graphics
textogram(rnorm(10000),range=c(-3,3))
# wait 0.2 seconds
wait(0.2,silent=FALSE) 
# see whether a system command is installed
check.linux.install("sed") 
# a nice progress bar
max <- 100; for (cc in 1:max) { loop.tracker(cc,max); wait(0.004,"s") }
# nice header
Header(c("SPACE","The final frontier"))
# memory req'd for proposed or actual object
estimate.memory(matrix(rnorm(100),nrow=10)) 
# a mode function (there isn't one included as part of base)
Mode(c(1,2,3,3,4,4,4))
# search for packages containing text, eg, 'misc'
search.cran("misc",repos="http://cran.ma.imperial.ac.uk/") 
# breakdown of processing time using proftools
# not run:  timeit(wait(2,"s") ,total.time=TRUE) 
# simulate a correlated dataset
corDat <- sim.cor(200,5)
cor(corDat) # show correlation matrix
prv(corDat) # show compact preview of matrix
# Dim() versus dim()
Dim(1:10); dim(1:10)
# check whether package is loaded (when not required or dependency)
packages.loaded("bigmemory")



