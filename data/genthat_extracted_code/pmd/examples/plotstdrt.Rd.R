library(pmd)


### Name: plotstdrt
### Title: Plot the std mass from GlobalStd algorithm in certain retention
###   time groups
### Aliases: plotstdrt

### ** Examples

## No test: 
data(spmeinvivo)
pmd <- getpaired(spmeinvivo)
std <- getstd(pmd)
plotstdrt(std,rtcluster = 6)
## End(No test)



