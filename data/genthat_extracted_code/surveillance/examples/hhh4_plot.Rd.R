library(surveillance)


### Name: plot.hhh4
### Title: Plots for Fitted 'hhh4'-models
### Aliases: plot.hhh4 plotHHH4_fitted plotHHH4_fitted1 plotHHH4_season
###   getMaxEV_season plotHHH4_maxEV getMaxEV plotHHH4_maps plotHHH4_ri
###   plotHHH4_neweights
### Keywords: hplot

### ** Examples

data("measlesWeserEms")

## fit a simple hhh4 model
measlesModel <- list(
    ar = list(f = ~ 1),
    end = list(f = addSeason2formula(~0 + ri(type="iid"), S=1, period=52),
               offset = population(measlesWeserEms)),
    family = "NegBin1"
    )
measlesFit <- hhh4(measlesWeserEms, measlesModel)

## fitted values for a single unit
plot(measlesFit, units=2)

## 'xaxis' option for a nicely formatted time axis
## default tick locations and labels:
plot(measlesFit, units=2, xaxis=list(epochsAsDate=TRUE, line=1))
## an alternative with monthly ticks:
oopts <- surveillance.options(stsTickFactors = c("%m"=0.75, "%Y" = 1.5))
plot(measlesFit, units=2, xaxis=list(epochsAsDate=TRUE,
    xaxis.tickFreq=list("%m"=atChange, "%Y"=atChange),
    xaxis.labelFreq=list("%Y"=atMedian), xaxis.labelFormat="%Y"))
surveillance.options(oopts)

## plot the multiplicative effect of seasonality
plot(measlesFit, type="season")

## dominant eigenvalue of the Lambda matrix (cf. Held and Paul, 2012)
getMaxEV(measlesFit)  # here simply constant and equal to exp(ar.1)
plot(measlesFit, type="maxEV")  # not very exciting

## fitted mean components by district averaged over time
if (requireNamespace("gridExtra"))
    plot(measlesFit, type="maps", labels=list(cex=0.6),
         main=c("Total","Endemic","Within district","From other districts"))

## random intercepts of the endemic component
plot(measlesFit, type="ri", component="end", labels=list(font=3, labels="GEN"))

## neighbourhood weights as a function of neighbourhood order
plot(measlesFit, type="neweights")  # boring, model has no "ne" component

## fitted values for the 6 regions with most cases and some customization
bigunits <- tail(names(sort(colSums(observed(measlesWeserEms)))), 6)
plot(measlesFit, units=bigunits,
     names=measlesWeserEms@map@data[bigunits,"GEN"],
     legend=5, legend.args=list(x="top"), xlab="Time (weekly)",
     hide0s=TRUE, ylim=c(0,max(observed(measlesWeserEms)[,bigunits])),
     start=c(2002,1), end=c(2002,26), par.settings=list(xaxs="i"))

## plot completely decomposed mean structure (useless without 'ne' component)
plot(measlesFit, units=bigunits, col=rainbow(measlesFit$nUnit), decompose=TRUE)

## sum fitted components over all units
plot(measlesFit, total=TRUE)



