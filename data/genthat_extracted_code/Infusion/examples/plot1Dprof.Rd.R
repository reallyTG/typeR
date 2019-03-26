library(Infusion)


### Name: plot1Dprof
### Title: Plot likelihood profiles
### Aliases: plot1Dprof plot2Dprof

### ** Examples

if (Infusion.getOption("example_maxtime")>40) {
 data(densv)
 slik <- infer_surface(densv) ## infer a log-likelihood surface
 slik <- MSL(slik) ## find the maximum of the log-likelihood surface
 plot1Dprof(slik,pars="s2",gridSteps=40,xlabs=list(s2=expression(paste(sigma^2))))
}



