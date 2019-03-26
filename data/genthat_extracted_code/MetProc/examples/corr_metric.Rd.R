library(MetProc)


### Name: corr_metric
### Title: Calculate Correlation of Missing Rates between Pooled Plasma and
###   Biological Samples
### Aliases: corr_metric

### ** Examples

library(MetProc)
#Read metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

#Get indices of samples and pooled plasma
grps <- get_group(metdata,'PPP','X') 

#get correlation metrics of metabolites
corrs <- corr_metric(metdata,grps) 



