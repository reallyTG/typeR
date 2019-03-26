library(wux)


### Name: ensembles
### Title: ENSEMBLES dataset
### Aliases: ensembles
### Keywords: datasets

### ** Examples

require(wux)
data(ensembles)
ensembles <- droplevels(subset(ensembles, subreg == "EU.ENS"))

str(ensembles)
parms <- c("delta.air_temperature", "perc.delta.precipitation_amount",
           "delta.global_radiation", "delta.wind_speed")
summary(ensembles, parms = parms)

## Not run: 
##D plot(ensembles,  "perc.delta.precipitation_amount",
##D               "delta.air_temperature", boxplots = TRUE, xlim = c(-10,10),
##D               ylim = c(0, 3),
##D               label.only.these.models = c(""),
##D               xlab = "Precipitation Amount [%]",
##D               ylab = "2-m Air Temperature [K]",
##D               main = "CCS 2-m Air Temp. and Precip. Amount 1961-90 to 2021-50",
##D               subreg.subset = c("EU.ENS"))
## End(Not run)

## comparing ENSEMBLES RCMs with its driving GCMs
data(ensembles_gcms)
ensembles_gcms.eu <- gdata::drop.levels(subset(ensembles_gcms, subreg ==
"EU.ENS"))
gcm.names <- levels(ensembles_gcms.eu$acronym)

vars.of.interest <- !names(ensembles) %in% c("delta.global_radiation", "delta.wind_speed")
ensembles <- ensembles[vars.of.interest]
ensembles.merge <- rbind(ensembles, ensembles_gcms.eu)
summary(ensembles.merge)

## Not run: 
##D plot(ensembles.merge,  "perc.delta.precipitation_amount",
##D               "delta.air_temperature", boxplots = TRUE, xlim = c(-10,10),
##D               ylim = c(0, 3),
##D               label.only.these.models = gcm.names,
##D               xlab = "Precipitation Amount [%]", ylab = "2-m Air Temperature [K]",
##D               main = "CCS 2-m Air Temp. and Precip. Amount 1961-90 to 2021-50",
##D               subreg.subset = c("EU.ENS"), draw.median.lines = FALSE)
## End(Not run)



