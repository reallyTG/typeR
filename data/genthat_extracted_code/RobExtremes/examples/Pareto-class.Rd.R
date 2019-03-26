library(RobExtremes)


### Name: Pareto-class
### Title: Pareto distribution
### Aliases: Pareto-class initialize,Pareto-method shape,Pareto-method
###   shape<-,Pareto-method Min,Pareto-method Min<-,Pareto-method
###   scale,Pareto-method *,Pareto,numeric-method
### Keywords: distribution

### ** Examples

(P1 <- new("Pareto", shape = 1, Min = 2))
plot(P1)
shape(P1)
Min(P1)
shape(P1) <- 4
Min(P1) <- 2
plot(P1)



