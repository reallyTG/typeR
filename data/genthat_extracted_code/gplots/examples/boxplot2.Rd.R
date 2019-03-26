library(gplots)


### Name: boxplot2
### Title: Produce a Boxplot Annotated with the Number of Observations
### Aliases: boxplot2
### Keywords: hplot

### ** Examples

data(state)

# n's at bottom
boxplot2( state.area ~ state.region)

# n's at top
boxplot2( state.area ~ state.region, top=TRUE)

# small red text
boxplot2( state.area ~ state.region, shrink=0.8, textcolor="red") 



