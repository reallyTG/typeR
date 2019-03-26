library(MetProc)


### Name: run_metric
### Title: Calculate Longest Run of Blocks where Data is Present
### Aliases: run_metric

### ** Examples

library(MetProc)

#Read in metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

#Get indices of pooled plasma and samples
grps <- get_group(metdata,'PPP','X')

#Get the longest run metric for each metabolite
runs <- run_metric(metdata,grps,scut=.5)



