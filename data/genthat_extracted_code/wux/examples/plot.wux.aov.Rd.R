library(wux)


### Name: plot.wux.aov
### Title: Barplots of the ANOVA results
### Aliases: plot.wux.aov
### Keywords: hplot models regression

### ** Examples

## load WUX and read WUX test data
require(wux)
data(ensembles)

wuxtest.df <- subset(ensembles, subreg == "GAR")

## unique model acronyms are required for reconstruction
wuxtest.df$acronym <- factor(paste(wuxtest.df$institute, "_",
wuxtest.df$rcm, sep="")) 

## reconstruction of the  missing data
reconstructLES.df <- reconstruct(wuxtest.df, factor1.name =
"acronym", factor2.name = "gcm", data.name =
"perc.delta.precipitation_amount") 

## calculate ANOVA
anova.list <- aovWux(perc.delta.precipitation_amount ~ acronym +
gcm, reconstructLES.df)

## barplot of ANOVA results
## Not run: 
##D plot(anova.list, ss.relative = TRUE, las = 1,
##D sd.unit = "%", legend.text = c("RCM", "GCM", "RES"), mgp = c(2.5,1,0),
##D main = "ANOVA Barplot", ylim = c(0,110))
## End(Not run)



