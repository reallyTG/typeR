library(primer)


### Name: BSsucc
### Title: Secondary succession data
### Aliases: BSsucc
### Keywords: datasets

### ** Examples

data(BSsucc)
library(lattice)
print(xyplot(value~ AGE, groups=variable, data=BSsucc, 
             type='smooth', span=.3, ylab="Percent Cover",
             xlab="Age Since Abandonment (y)",
             auto.key=list(columns=3, space="top", lines=TRUE, points=FALSE)))



