library(sigr)


### Name: wrapCohenD.data.frame
### Title: Wrap Cohen's D (effect size between groups).
### Aliases: wrapCohenD.data.frame

### ** Examples


d <- data.frame(x = c(1,1,2,2,3,3,4,4),
                y = c(1,2,3,4,5,6,7,7))
render(wrapCohenD(d,'x','y'))




