library(sppmix)


### Name: est_mix_damcmc
### Title: Estimate a mixture model parameters using MCMC
### Aliases: est_mix_damcmc est_mix_bdmcmc

### ** Examples

## No test: 
fit <- est_mix_damcmc(spatstat::redwood, m = 3)
fit
plot(fit)
#We work with the California Earthquake data. We fit an IPPP with intensity surface modeled
#by a mixture with 5 normal components.
CAfit=est_mix_damcmc(CAQuakes2014.RichterOver3.0, m=5, L = 20000)
#Now retrieve the surface of Maximum a Posteriori (MAP) estimates of the mixture parameter.
#Note that the resulting surface is not affected by label switching.
MAPsurf=GetMAPEst(CAfit)
#Plot the states and the earthquake locations along with the fitted MAP IPPP intensity
#surface.
ret=PlotUSAStates(states=c('California','Nevada','Arizona'), showcentroids=FALSE,
 shownames=TRUE,main= "Earthquakes in CA, 2014",pp=CAQuakes2014.RichterOver3.0, surf=MAPsurf,
 boundarycolor="white",namescolor="white")
plot(CAfit)
#check labels
check_labels(CAfit)
# Fix label switching, start with approx=TRUE
post_fixed = FixLS_da(CAfit, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed,separate = FALSE)
#this one works generally better but it is slow for large m
post_fixed = FixLS_da(CAfit,approx=FALSE, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed,separate = FALSE)
## End(No test)

## No test: 
fitBD <- est_mix_bdmcmc(spatstat::redwood, m = 5)
fitBD
plotsBDredwood=plot(fitBD)
#Earthquakes example
CAfitBD=est_mix_bdmcmc(pp = CAQuakes2014.RichterOver3.0, m = 5)
BDtab=GetBDTable(CAfitBD)#retrieve frequency table and MAP estimate for number of components
BDtab
MAPm=BDtab$MAPcomp
plotsCAfitBD=plot(CAfitBD)
#get the surface of posterior means with MAP components and plot it
plotmix_2d(GetPMEst(CAfitBD,MAPm),CAQuakes2014.RichterOver3.0)
#retrieve all BDMCMC realizations corresponding to a mixture with MAP components
BDfitMAPcomp=GetBDCompfit(CAfitBD,MAPm)
BDfitMAPcomp
plot(BDfitMAPcomp$BDsurf,main=paste("Mixture intensity surface with",MAPm, "components"))
#Example of Dropping bad realizations and working with the MAP surface
open_new_plot=FALSE
truncate=FALSE
truemix4=rnormmix(m = 4, sig0 = .1, df = 5,xlim= c(-2,2), ylim = c(-2,2))
plot(truemix4,xlim= c(-2,2), ylim = c(-2,2),whichplots=0, open_new_window=
 open_new_plot)+add_title("True mixture of normals density")
trueintsurfmix4=to_int_surf(truemix4,lambda = 150,win =spatstat::owin( c(-2,2),c(-2,2)))
#not truncating so let us use a larger window
bigwin=spatstat::owin(c(-4,4),c(-4,4))
ppmix4 <- rsppmix(intsurf = trueintsurfmix4,truncate = truncate,win=bigwin)# draw points
print(plotmix_2d(trueintsurfmix4,ppmix4, open_new_window=open_new_plot,
 win=spatstat::owin(c(-4,4),c(-4,4)))+add_title(
 "True Poisson intensity surface along with the point pattern, W=[-4,4]x[-4,4]",
 lambda =trueintsurfmix4$lambda,m=trueintsurfmix4$m,n=ppmix4$n))
BDMCMCfit=est_mix_bdmcmc(pp = ppmix4, m = 5,L=30000,truncate = truncate)
#check the original distribution of the number of components
plot_CompDist(BDMCMCfit, open_new_window=open_new_plot)
#get the realizations corresponding to the MAP number of components
BDtab=GetBDTable(BDMCMCfit,FALSE)#retrieve frequency table and MAP estimate for the
#number of components
MAPm=BDtab$MAPcomp
BDMCMCfitMAPcomp=GetBDCompfit(BDMCMCfit,MAPm)
BDMCMCfitMAPcompgens=BDMCMCfitMAPcomp$BDgens
#look at the range of the means with the degenerate realizations included
print(range(BDMCMCfitMAPcompgens$genmus[,1,]))
print(range(BDMCMCfitMAPcompgens$genmus[,2,]))
#use the original output of the BDMCMC and apply 10% burnin (default)
BDMCMCfit=drop_realization(BDMCMCfit)
#now we drop the bad realizations
BDMCMCfit=drop_realization(BDMCMCfit, (BDMCMCfit$Badgen==1))
#we see how many realizations are left
plot_CompDist(BDMCMCfit, open_new_window=open_new_plot)
#get the realizations for the MAP only
BDMCMCfitMAPcomp=GetBDCompfit(BDMCMCfit,MAPm)
BDMCMCfitMAPcompgens=BDMCMCfitMAPcomp$BDgens
#check again the range of values for the x-y coords of the component means; they
#should be within the window
print(range(BDMCMCfitMAPcompgens$genmus[,1,]))
print(range(BDMCMCfitMAPcompgens$genmus[,2,]))
#check the MAP surface
plotmix_2d(BDMCMCfitMAPcomp$BDsurf,ppmix4, open_new_window=open_new_plot,
 win=bigwin) +add_title("MAP Poisson intensity surface along with the point pattern",
 lambda =BDMCMCfitMAPcomp$BDsurf$lambda, m=BDMCMCfitMAPcomp$BDsurf$m, n=ppmix4$n,
 L=BDMCMCfitMAPcomp$BDgens$L)
plot_chains(BDMCMCfitMAPcompgens, open_new_window=open_new_plot, separate = FALSE)
#burnin has been applied, set to zero and check for label switching
labelswitch=check_labels(BDMCMCfitMAPcompgens,burnin=0)
#use the identifiability constraint approach first
post_fixedBDMCMCfitIC = FixLS_da(BDMCMCfitMAPcompgens,burnin=0)
plot_chains(post_fixedBDMCMCfitIC, open_new_window=open_new_plot, separate = FALSE)
print(plot_ind(post_fixedBDMCMCfitIC, burnin=0, open_new_window=
 open_new_plot)+add_title("Posterior means of the membership indicators (IC permuted labels)",
 m = post_fixedBDMCMCfitIC$m, n = post_fixedBDMCMCfitIC$data$n))
permSurfaceofPostMeansIC=GetPMEst(post_fixedBDMCMCfitIC, burnin=0)
print(plotmix_2d(permSurfaceofPostMeansIC,ppmix4, open_new_window=open_new_plot,
 win=bigwin)+add_title("Poisson surface of posterior means (IC)",
 lambda=permSurfaceofPostMeansIC$lambda, m=permSurfaceofPostMeansIC$m, n=ppmix4$n,
 L=post_fixedBDMCMCfitIC$L))
#use the decision theoretic approach via SEL to find the best permutation; this one should
#work much better
post_fixedBDMCMCfitSEL = FixLS_da(BDMCMCfitMAPcompgens,approx=FALSE, burnin=0)
plot_chains(post_fixedBDMCMCfitSEL, open_new_window=open_new_plot, separate = FALSE)
print(plot_ind(post_fixedBDMCMCfitSEL, burnin=0, open_new_window=open_new_plot)+add_title(
 "Posterior means of the membership indicators (best permutation)",
 m=post_fixedBDMCMCfitSEL$m,n = post_fixedBDMCMCfitSEL$data$n))
permSurfaceofPostMeansSEL=GetPMEst(post_fixedBDMCMCfitSEL, burnin=0)
print(plotmix_2d(permSurfaceofPostMeansSEL,ppmix4, open_new_window=open_new_plot,
 win=bigwin)+ add_title("Poisson surface of posterior means (best permutation)",
 lambda=permSurfaceofPostMeansSEL$lambda, m=permSurfaceofPostMeansSEL$m,
 n=ppmix4$n,L=post_fixedBDMCMCfitSEL$L))
## End(No test)




