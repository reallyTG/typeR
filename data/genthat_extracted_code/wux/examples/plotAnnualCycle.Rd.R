library(wux)


### Name: plotAnnualCycle
### Title: Plots the annual cycle
### Aliases: plotAnnualCycle
### Keywords: hplot univar

### ** Examples

## load WUX and read WUX test data
require(wux)
data(ensembles)

wuxtest.df <- subset(ensembles, subreg == "GAR")

## set data frame for model marks
mark.df <- subset(wuxtest.df, acronym %in% c("ICTP-REGCM3", "MPI-M-REMO"))
mark.df2 <- gdata::drop.levels(mark.df)

## Not run: 
##D plotAnnualCycle(wuxtest.df, "perc.delta.precipitation_amount", mark.df =
##D mark.df, plot.legend = TRUE, boxfill = "light yellow", notch =
##D FALSE,  boxwex = 0.5, ylim = c(-60,60), plot.quantiles =
##D c(0.02,0.25,0.5,0.75,0.98), boxcol = "red", ylab = "Precipitation
##D Amount [%]", main = "Annual cycle ", las = 1, copyright = TRUE)
## End(Not run)



