library(wux)


### Name: ensembles_gcms
### Title: GCM forcing data from the ENSEMBLES project
### Aliases: ensembles_gcms
### Keywords: datasets

### ** Examples

require(wux)
data(ensembles_gcms)
ensembles.gcm.names <- levels(ensembles_gcms$acronym) #8 GCM names
summary(ensembles_gcms)

## Now lets compare this dataset to the CMIP3 ensemble
data(cmip3_2050)     # GCMs of CMIP3 ensemble
cmip3_2050.sub <- subset(cmip3_2050, subreg %in% c("World", "EU.ENS")
                       & em.scn == "A1B") 
cmip3_2050.sub <- droplevels(cmip3_2050.sub)
## "mpi_echam5-r3", "bccr_bcm2_0-r1", "ipsl_cm4-r2" can be found
## in the ensembles_gcms dataset as well as in the cmip3_2050 dataset
## so we delete it from one of these dataset
ensembles_gcms.sub <- subset(ensembles_gcms, !acronym %in%
                                c("mpi_echam5-r3", "bccr_bcm2_0-r1",
                                  "ipsl_cm4-r2"))
ensembles_gcms.sub <- gdata::drop.levels(ensembles_gcms.sub)
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



