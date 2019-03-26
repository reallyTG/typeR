library(seqmon)


### Name: alphaspendf
### Title: The default alpha spending function
### Aliases: alphaspendf

### ** Examples

t<-c(0.33,0.67,1)
alphas<-alphaspendf(t)

## The function is currently defined as
function (t) 
0.025 * t^4



