library(sppmix)


### Name: plot.sppmix
### Title: Plot a spatial point pattern
### Aliases: plot.sppmix

### ** Examples

## No test: 
mix1 <- rnormmix(5, sig0 = .01, df = 5, xlim=c(0, 5), ylim=c(0, 5))
intsurf1=to_int_surf(mix1, lambda = 40, win =spatstat::owin( c(0, 5),c(0, 5)))
pp1 <- rsppmix(intsurf1)
plot(pp1)
plot(pp1, mus=intsurf1$mus)
plot(pp1,mus=intsurf1$mus)+add_title(
 "Poisson point pattern along with the true component means", m=intsurf1$m,n=pp1$n)
plot(pp1, mus = intsurf1$mus, lambda = intsurf1$lambda)
plot(pp1, mus = intsurf1$mus)+ add_title(
 "Poisson point pattern along with the true component means", lambda = intsurf1$lambda,
 m=intsurf1$m,n=pp1$n)
#use the demo intensity surface
demo_intsurf
pp2 <- rsppmix(demo_intsurf,marks = 1:3)
plot(pp2)
plot(pp2, mus = demo_intsurf$mus)#plot the mixture means as well
#plot the points with different colors depending on the true component label
plot(pp2, colors = TRUE)
#plot the points with different colors depending on the estimated component label
fit <- est_mix_damcmc(pp2, 2)
est_comp <- GetMAPLabels(fit)
plot(pp2, estcomp = est_comp, colors = TRUE)
#generate and plot a marked point pattern
newMPP=rMIPPP_cond_mark()
plot(newMPP$genMPP, showmarks=TRUE)
## End(No test)




