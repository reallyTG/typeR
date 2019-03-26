library(wux)


### Name: reconstruct
### Title: Missing value reconstruction based on ANOVA
### Aliases: reconstruct
### Keywords: datagen models regression classes NA iteration

### ** Examples

## load WUX and read WUX test data
require(wux)
data(ensembles)

wuxtest.df <- subset(ensembles, subreg == "GAR")

## unique model acronyms are required for reconstruction
wuxtest.df$acronym <- factor(paste(wuxtest.df$institute, "_", wuxtest.df$rcm, sep=""))

## reconstruction of the  missing data
reconstructLES.df <- reconstruct(wuxtest.df,
  factor1.name = "acronym", factor2.name = "gcm", data.name =
  "perc.delta.precipitation_amount", method = "LES")

## reconstruction of the  missing data using iterative apporach from
## Deque et al (2007)
reconstructIterative.df <- reconstruct(wuxtest.df,
  factor1.name = "acronym", factor2.name = "gcm", data.name =
  "perc.delta.precipitation_amount", method = "Iterative",
  iterations.num = 10)

## reconstruction of the  missing data using iterative apporach with
## cross-calculation. This can take some time.
## Not run: 
##D reconstructIterative.df <- reconstruct(wuxtest.df,
##D   factor1.name = "acronym", factor2.name = "gcm", data.name =
##D   "perc.delta.precipitation_amount", method = "IterativeCC",
##D   iterations.num = 10)
## End(Not run)



