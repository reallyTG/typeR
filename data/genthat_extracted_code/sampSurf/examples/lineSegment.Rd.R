library(sampSurf)


### Name: lineSegment
### Title: Generate Objects of Class "'lineSegment'"
### Aliases: lineSegment
### Keywords: ~kwd1 ~kwd2

### ** Examples

# a one chain segment...
ls = lineSegment(length=66, orientation=45, centerPoint=c(x=100, y=80), units='English')
summary(ls)
plot(ls, showLineCenter=TRUE, cex=2)



