library(wux)


### Name: plot.wux.df
### Title: X - Y Scatterplot of climate change signals
### Aliases: plot.wux.df
### Keywords: hplot multivariate

### ** Examples

require(wux)

### ENSEMBLES RCM analysis
data(ensembles)

## Not run: 
##D plot(ensembles, "perc.delta.precipitation_amount",
##D   "delta.air_temperature", boxplots = TRUE, xlim = c(-40,40),
##D   ylim = c(0, 4), label.only.these.models = c("ICTP-REGCM3", "MPI-M-REMO"), 
##D   xlab = "Precipitation Amount [%]", ylab = "2-m Air Temperature [K]",
##D   main = "Scatterplot", subreg.subset = c("GAR"))
## End(Not run)

### now see where ENSMEBLES GCMs lie within CMIP3 ensemble
data(ensembles_gcms) # GCMs for forcing of ENSEMBLES RCMs
data(cmip3_2050)     # GCMs of CMIP3 ensemble

ensembles.gcm.names <- levels(ensembles_gcms$acronym) #8 GCM names

cmip3_2050.sub <- subset(cmip3_2050, subreg %in% c("World", "EU.ENS")
                       & em.scn == "A1B") 
cmip3_2050.sub <- droplevels(cmip3_2050.sub)
ensembles_gcms.sub <- subset(ensembles_gcms, !acronym %in%
                                c("mpi_echam5-r3", "bccr_bcm2_0-r1",
                                  "ipsl_cm4-r2"))
ensembles_gcms.sub <- droplevels(ensembles_gcms.sub)
## combine cmip3 and ENSEMBLES GCMs in one data.frame
gcms.combined <- rbind(ensembles_gcms.sub, cmip3_2050.sub)

## Scatterplot
prec.range <- range(gcms.combined$perc.delta.precipitation_amount) + c(-1, 1)
tas.range <- range(gcms.combined$delta.air_temperature)
## Not run: 
##D plot(gcms.combined,
##D                "perc.delta.precipitation_amount", "delta.air_temperature",
##D                subreg.subset = "EU.ENS", draw.median.lines = FALSE,
##D                label.only.these.models = ensembles.gcm.names,
##D                xlim = prec.range,
##D                ylim = tas.range,
##D                main = "GCMs from ENSEMBLES project within CMIP3 SRESA1B ensemble",
##D                draw.seperate.legend = TRUE)
## End(Not run)







