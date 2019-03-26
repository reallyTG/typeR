library(MetProc)


### Name: subset_met
### Title: Group Metabolites based on Pooled Plasma Missing Rate
### Aliases: subset_met

### ** Examples

library(MetProc)

#Read in metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

#Get indices of pooled plasma and samples
groups <- get_group(metdata,"PPP","X")

#Calculate a pooled plasma missing rate and sample missing rate
#for each metabolite in data
missrate <- get_missing(metdata,groups[['pp']],groups[['sid']])

#Group metabolites into 5 groups based on pooled plasma
#missing rate
subsets <- subset_met(metdata,missrate[['ppmiss']],5,.02,.95)



