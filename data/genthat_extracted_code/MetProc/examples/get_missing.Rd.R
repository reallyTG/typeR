library(MetProc)


### Name: get_missing
### Title: Compute Missing Rates of Biological Samples and Pooled Plasma
###   Samples
### Aliases: get_missing

### ** Examples

library(MetProc)

#Read metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

#Get groups based on samples and pooled plasma
grps <- get_group(metdata,'PPP','X') 

#Get the missing rates of each category for all metabolites
missrate <- get_missing(metdata,grps[['pp']],grps[['sid']]) 



