library(FlexDir)


### Name: FD.ternaryplot
### Title: Ternary Plot of a Flexible Dirichlet
### Aliases: FD.ternaryplot

### ** Examples

data <- FD.generate(n=20,a=c(12,7,15),p=c(0.3,0.4,0.3),t=8)
data
results <- FD.estimation(data, normalize=TRUE,iter.initial.SEM = 5,iter.final.EM = 10)
results
FD.ternaryplot(results)
FD.ternaryplot(results, zoomed=FALSE, showgrid=TRUE, showdata=FALSE, nlevels=3)




