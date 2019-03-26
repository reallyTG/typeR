library(NeatMap)


### Name: lineplot
### Title: Line plots of profiles in a grid of embedded results
### Aliases: lineplot
### Keywords: hplot

### ** Examples

#PCA and line plot. Notice how the profiles are dominated by two high value columns
mtcars.PCA<-prcomp(mtcars);
lineplot(mtcars.PCA$x,mtcars);

#Use ylim and clipping to allow us to focus on the columns with lower values
lineplot(mtcars.PCA$x,mtcars,ylim=c(0,10),clipped=TRUE)



