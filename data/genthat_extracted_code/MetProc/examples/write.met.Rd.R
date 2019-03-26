library(MetProc)


### Name: write.met
### Title: Write Metabolomics Dataset of Standard Structure
### Aliases: write.met

### ** Examples

library(MetProc)
#Read in metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

#Separate likely artifacts from true signal using default settings
results <- met_proc(metdata,plot=FALSE)

#Write the retained metabolites to current directory
write.met(results,'sample_retained.csv',
system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3,metidcol=1,fvalue=8,sep=",",type='keep')



