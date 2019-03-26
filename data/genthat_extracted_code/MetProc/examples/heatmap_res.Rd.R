library(MetProc)


### Name: heatmap_res
### Title: Plot Patterns of Missing Data Across Metabolites
### Aliases: heatmap_res

### ** Examples

library(MetProc)

#Read in metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

#Get the good versus bad metabolites
results <- met_proc(metdata)

#Plot Removed metabolites
#Similarly run for retained metabolites but
#replacing 'remove' with 'keep'
heatmap_res(results[['remove']],missratecut=.02,title='Removed Metabolites')



