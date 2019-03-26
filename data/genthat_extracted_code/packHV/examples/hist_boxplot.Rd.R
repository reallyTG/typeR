library(packHV)


### Name: hist_boxplot
### Title: Plot a histogram with a boxplot below
### Aliases: hist_boxplot

### ** Examples

par(mfrow=c(1,2))
hist_boxplot(rnorm(100),col="lightblue",freq=TRUE)
hist_boxplot(rnorm(100),col="lightblue",freq=FALSE,density=TRUE)



