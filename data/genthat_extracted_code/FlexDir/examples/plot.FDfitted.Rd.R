library(FlexDir)


### Name: plot.FDfitted
### Title: Plot Method for FDfitted Objects
### Aliases: plot.FDfitted

### ** Examples

data <- FD.generate(n=20,a=c(12,7,15),p=c(0.3,0.4,0.3),t=8)
data
results <- FD.estimation(data, normalize=TRUE,iter.initial.SEM = 5,iter.final.EM = 10)
results
plot(results)
plot(results, type='right', var=c(3,2), zoomed=FALSE, showgrid=TRUE, showdata=FALSE, nlevels=3)





