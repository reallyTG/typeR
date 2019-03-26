library(spray)


### Name: asum
### Title: Sum over dimension margins
### Aliases: asum asum.spray asum_inverted process_dimensions
### Keywords: symbolmath

### ** Examples


S <- spray(matrix(sample(0:2,60,replace=TRUE),ncol=3),addrepeats=TRUE)
S

asum(S,1)
asum(S,1:2)

asum(S,1:2,drop=FALSE)


asum(S,c(1,3)) == asum_inverted(S,2)





