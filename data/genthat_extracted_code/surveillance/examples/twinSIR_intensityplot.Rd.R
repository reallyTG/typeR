library(surveillance)


### Name: twinSIR_intensityplot
### Title: Plotting Paths of Infection Intensities for 'twinSIR' Models
### Aliases: plot.twinSIR intensityplot.twinSIR intensityplot.simEpidata
### Keywords: hplot aplot dplot methods

### ** Examples

data("fooepidata")
data("foofit")

# an overview of the evolution of the epidemic
plot(fooepidata)

# overall total intensity
plot(foofit, which="total")

# overall epidemic proportion
epi <- plot(foofit, which="epidemic")

# look at returned values
head(epi)

# add the inverse overall endemic proportion = 1 - epidemic proportion
ende <- plot(foofit, which="endemic", add=TRUE, col=2)
legend("right", legend="endemic proportion \n(= 1 - epidemic proportion)",
       lty=1, col=2, bty="n")

# individual intensities
tmp <- plot(foofit, which="total", aggregate=FALSE, col=rgb(0,0,0,alpha=0.1),
    main=expression("Individual infection intensities " *
                    lambda[i](t) == Y[i](t) %.% (e[i](t) + h[i](t))))
# return value: matrix of individual intensity paths
str(tmp)

# plot intensity path only for individuals 3 and 99
matplot(x=tmp[,1], y=tmp[,1+c(3,99)], type="S", ylab="Force of infection",
        xlab="time", main=expression("Paths of the infection intensities " *
                                  lambda[3](t) * " and " * lambda[99](t)))
legend("topright", legend=paste("Individual", c(3,99)), col=c(1,2), lty=c(1,2))



