library(sppmix)


### Name: PlotUSAStates
### Title: Visualization of USA states and their counties
### Aliases: PlotUSAStates

### ** Examples

## No test: 
#plot the continental USA with uniformly sampled discrete marks from 10 different levels
ret=PlotUSAStates(states=ContinentalUSA_state_names, levels=1:10, grayscale = FALSE,
 shownames=TRUE, plotlevels =TRUE, discretelevels=TRUE, main="Continental USA (generated levels)")
#now use continuous marks
ret=PlotUSAStates(states=ContinentalUSA_state_names, shownames=FALSE, discretelevels=FALSE,
 main="Continental USA (generated probabilities)", guidemain="Probability", showcentroids = FALSE)
#Fit an IPPP to the California Earthquake data
fitDA=est_mix_damcmc(CAQuakes2014.RichterOver3.0, 8, L = 20000)
#get the surface of Maximum a Posteriori estimates
MAPsurf=GetMAPEst(fitDA)
#plot the states and the earthquake points along with the fitted MAP IPPP intensity surface
ret=PlotUSAStates(states=c('California','Nevada','Arizona'), showcentroids=FALSE,
 shownames=TRUE, main="Earthquakes in CA, 2014", pp=CAQuakes2014.RichterOver3.0, surf=MAPsurf,
 boundarycolor="white", namescolor="white")
#Visualize the Tornado data about MO
#plot the states and the tornado points
ret=PlotUSAStates(states=c('Iowa','Arkansas','Missouri','Illinois','Indiana','Kentucky',
 'Tennessee','Kansas','Nebraska','Texas','Oklahoma','Mississippi','Alabama','Louisiana'),
 showcentroids=FALSE, shownames=TRUE, plotlevels = FALSE, main="Tornadoes about MO, 2011",
 pp=Tornadoes2011MO)
#Visualize aggregate income levels in MO by county using data from the American Community
#Survey (ACS)
#plot in the original scale first; here we pass the marks vector which contains the aggregate
#income values of Missourian counties
ret=PlotUSAStates(showcounties=TRUE, states=c('Missouri'), showcentroids=TRUE, typecentroid=1,
 discretelevels=FALSE, shownames=TRUE, plotlevels=TRUE, marks=MOAggIncomeLevelsPerCounty,
 main="Aggregate Income in MO, 2014", guidemain = "Income level", namescolor="gray",
 boundarycolor="gray")
#plot in the log scale
ret=PlotUSAStates(showcounties=TRUE, states=c('Missouri'), showcentroids=TRUE, typecentroid=1,
 discretelevels=FALSE, shownames=TRUE, plotlevels=TRUE, marks=log(MOAggIncomeLevelsPerCounty),
 main="Aggregate Income in MO, 2014", guidemain = "Income level\n(log scale)", namescolor="gray",
 boundarycolor="gray")
#plot the marker points, county boundaries and names
ret=PlotUSAStates(showcounties=TRUE, states=c('Missouri'), showcentroids=TRUE, typecentroid = 1,
 discretelevels=FALSE, shownames=TRUE, plotlevels=FALSE, marks=log(MOAggIncomeLevelsPerCounty),
 main="Marker points for Missouri counties")
#now plot only the marker points, we treat this as a marked IPPP
ret=PlotUSAStates(showcounties=TRUE, states=c('Missouri'), showcentroids=TRUE, typecentroid = 1,
 discretelevels=FALSE, shownames=FALSE, plotlevels=FALSE, marks=log(MOAggIncomeLevelsPerCounty),
 main="Marker points for Missouri counties", boundarycolor = NULL)
#let us discretize log(income) to 3 levels; low if <=20, average if >20 and <=23, and high if >23
newmarks=rep(0,length(MOAggIncomeLevelsPerCounty))
newmarks[log(MOAggIncomeLevelsPerCounty)<=20]=1
newmarks[log(MOAggIncomeLevelsPerCounty)>20 & log(MOAggIncomeLevelsPerCounty)<=23]=2
newmarks[log(MOAggIncomeLevelsPerCounty)>23]=3
table(newmarks)
levels=c("low","average","high")
ret=PlotUSAStates(showcounties=TRUE, states=c('Missouri'), showcentroids=TRUE, typecentroid=1,
 discretelevels=TRUE, shownames=TRUE, plotlevels=TRUE, main="Aggregate Income in MO, 2014",
 marks=newmarks, levels=levels, guidemain = "Income level", namescolor="gray",
 boundarycolor="gray")
#now fit a marked IPPP model, use the PP of marker points
MPP=ret$PPPMarker
mpp_est <- est_MIPPP_cond_loc(MPP,r=1, hyper=0.2)
plot_MPP_probs(mpp_est)
#now obtain a BDMCMC fit for the ground process this way we can cluster the data
BDMCMCfit <- est_mix_bdmcmc(MPP,m=10,L = 50000)
plot_CompDist(BDMCMCfit)
#use the original output of BDMCMC and apply 10% burnin (default)
BDMCMCfit=drop_realization(BDMCMCfit)
#get the realizations corresponding to the MAP number of components
BDtab=GetBDTable(BDMCMCfit,FALSE)#retrieve frequency table and MAP estimate for
#the number of components
MAPm=BDtab$MAPcomp
BDMCMCfitMAPcomp=GetBDCompfit(BDMCMCfit,MAPm)
BDMCMCfitMAPcompgens=BDMCMCfitMAPcomp$BDgens
MAPsurf=GetMAPEst(BDMCMCfitMAPcompgens)
plotmix_2d(MAPsurf,MPP)+add_title(
 "IPPP intensity surface of MAP estimates (MAP number of components)",
 lambda =MAPsurf$lambda, m=MAPsurf$m, n=MPP$n, L=MAPsurf$L)
plot_ind(BDMCMCfitMAPcompgens)
ret=PlotUSAStates(showcounties=TRUE, states=c('Missouri'),
 showcentroids=TRUE, typecentroid=1, discretelevels=TRUE, shownames=TRUE,
 main="Ground surface of MAP estimates", marks=newmarks, levels=levels,
 guidemain = "Income level", namescolor="gray", boundarycolor="gray",
 pp=MPP, surf=MAPsurf)
#obtain and plot the Bayesian model average; first drop the bad realizations
BDMCMCfit=drop_realization(BDMCMCfit,(BDMCMCfit$Badgen==1))
BMAest=GetBMA(BDMCMCfit)
ret=PlotUSAStates(showcounties=TRUE, states=c('Missouri'),
 showcentroids=TRUE, typecentroid=1, discretelevels=TRUE, shownames=TRUE,
 main="Bayesian model average ground intensity surface", marks=newmarks,
 levels=levels, guidemain = "Income level", namescolor="gray",
 boundarycolor="gray", pp=MPP, surf=BMAest)
## End(No test)




