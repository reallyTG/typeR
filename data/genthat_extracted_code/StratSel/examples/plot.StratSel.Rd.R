library(StratSel)


### Name: plot
### Title: Plots a StratSel Object
### Aliases: plot.StratSel
### Keywords: Illustration

### ** Examples

data(data.fake)
# Running just an agent error model (note: corr=FALSE) with \code{var.C} being 
#part of both actors' utilities
out1 <- StratSel(Y ~ var.A + var.B | var.C + var.D | var.E + var.C, data=data.fake, corr=FALSE)
par(mfrow=c(3,1))
plot(out1, profile=c(1,0.2,-0.2,1,0.2,-0.2,1,0.1,-0.3), 
 x.move=c(5,9),x.range=c(-15,15), ci=0.7, uncertainty=TRUE)



