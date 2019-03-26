library(sppmix)


### Name: plot.bdmcmc_res
### Title: Plot results from a BDMCMC fit
### Aliases: plot.bdmcmc_res

### ** Examples

## No test: 
fit <- est_mix_bdmcmc(pp = spatstat::redwood, m = 10)
plot(fit)
#Tornadoes
ret=PlotUSAStates(states=c('Iowa','Arkansas', 'Missouri','Illinois','Indiana','Kentucky',
 'Tennessee', 'Kansas','Nebraska','Texas','Oklahoma','Mississippi', 'Alabama','Louisiana'),
 showcentroids=FALSE,shownames=TRUE, plotlevels = FALSE, main="Tornadoes about MO, 2011",
 pp=Tornadoes2011MO)
print(ret)
Tornfit=est_mix_bdmcmc(pp = Tornadoes2011MO, m = 7)
TornResults=plot(Tornfit)#if we plot the Bayesian model average return it
TornResults
if(!is.null(TornResults$BMA)){
  BMA_image=TornResults$BMA#must answer yes above or compute it using GetBMA
  burnin=.1*Tornfit$L
  title1 = paste("Bayesian model average of", Tornfit$L-burnin,"posterior realizations")
  plotmix_3d(BMA_image,title1=title1)
  plot_density(as.data.frame(BMA_image))+ggplot2::ggtitle(
   "Bayesian Model Average Intensity")
  plot_density(as.data.frame(BMA_image),TRUE)+ggplot2::ggtitle(
   "Contours of the Bayesian Model Average Intensity")}
# Work with the MAP intensity
Mapsurf=TornResults$Mapsurf
plot(Mapsurf)
#retrieve realizations for the MAP number of components only
tab=GetBDTable(Tornfit)
MAPm=tab$MAPcomp
BDfitMAPcomp=GetBDCompfit(Tornfit,MAPm)
summary(BDfitMAPcomp)
summary(BDfitMAPcomp$BDgens)
plot(BDfitMAPcomp$BDsurf,main=paste(
 "Poisson Mixture intensity surface, MAP # of components=",MAPm))
#check labels
check_labels(BDfitMAPcomp$BDgens)
# If present then fix label switching, start with approx=TRUE
post_fixed = FixLS_da(BDfitMAPcomp$BDgens, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed,separate = FALSE)
#this one works better
post_fixed = FixLS_da(BDfitMAPcomp$BDgens,approx=FALSE, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed,separate = FALSE)
## End(No test)




