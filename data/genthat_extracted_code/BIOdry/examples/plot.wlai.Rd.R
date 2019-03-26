library(BIOdry)


### Name: plot.wlai
### Title: Plot an wlai object
### Aliases: plot.wlai

### ** Examples

##random simulation of climatic records
set.seed(1)
pr <- rnorm(12,1,1)
tm <- rnorm(12,0,1)
cld <- data.frame(pr,tm)
##labels of months from october to september
rownames(cld) <- month.abb[c(10:12,1:9)]
rownames(cld) <- c(10:12,1:9)
##computation of the aridity index and climate diagram
AI <- wlai(cld)
plot.wlai(AI)



