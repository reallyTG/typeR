library(wux)


### Name: hist
### Title: Plots histograms and kernel density estimates
### Aliases: hist.wux.df
### Keywords: hplot distribution univar

### ** Examples

## load WUX and read WUX test data
require(wux)
data(ensembles)

wuxtest.df <- subset(ensembles, subreg == "GAR")

## set dataframe for model marks
mark.df <- subset(wuxtest.df, acronym %in% c("ICTP-REGCM3", "MPI-M-REMO"))
mark.df <- droplevels(mark.df)

## histogram plot
## Not run: 
##D hist(x = wuxtest.df, var.name =
##D   "perc.delta.precipitation_amount", xlim = c(-50,50), ylim = c(0,0.12),
##D   xtick.number = 9, xminor.tick = TRUE,  ytick.number = 5,
##D   yminor.tick = TRUE, xlab = "Precipitation Amount [%]", main =
##D   "WUX histogram", plot.legend = TRUE, mark.df = mark.df, hist1.col =
##D   "dark blue")
##D 
##D graphics.off()
## End(Not run)



