library(MetProc)


### Name: met_proc
### Title: Separates Metabolites into Likely True Metabolites and Likely
###   Measurement Artifacts
### Aliases: met_proc

### ** Examples

library(MetProc)

#Read in metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

#Separate likely artifacts from true signal using default settings
results <- met_proc(metdata,plot=FALSE)

#Separate likely artifacts from true signal using custom cutoffs and criteria
#Uses 5 groups of metabolites based on the pooled plasma missing rate, applies
#custom metric thersholds, sets the minimum pooled plasma missing rate to 0.05,
#sets the maximum pooled plasma missing rate to 0.95, sets the missing rate
#to consider a block of samples present at 0.6
results <- met_proc(metdata, numsplit = 5, cor_rates = c(0.4,.7,.75,.7,.4),
runlengths = c(80, 10, 12, 10, 80), mincut = 0.05, maxcut = 0.95, scut = 0.6,
ppkey = 'PPP', sidkey = 'X', plot = FALSE)

#Uses default criteria for running met_proc, but plots the results
#and saves them in a PDF in the current directory.
#Colors of the histograms set by histcolors.
#Adding plots may substantially increase running time if many
#samples are included
results <- met_proc(metdata, plot = TRUE, missratecut = 0.001, 
histcolors = c('red','yellow','green','blue','purple'))



