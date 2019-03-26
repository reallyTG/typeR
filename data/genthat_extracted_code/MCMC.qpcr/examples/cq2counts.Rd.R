library(MCMC.qpcr)


### Name: cq2counts
### Title: Prepares qRT-PCR data for mcmc.qpcr analysis
### Aliases: cq2counts

### ** Examples


data(coral.stress) 
data(amp.eff) 
genecolumns=c(5:19) # specifying where the Ct data are in the data table
conditions=c(1:4) # specifying data table columns containing factors  
# calculating molecule counts and reformatting:
dd=cq2counts(data=coral.stress,genecols=genecolumns,
condcols=conditions,effic=amp.eff,Cq1=37) 




