library(MCMC.qpcr)


### Name: mcmc.qpcr
### Title: Analyzes qRT-PCR data using generalized linear mixed model
### Aliases: mcmc.qpcr

### ** Examples


data(beckham.data)
data(beckham.eff)

# analysing the first 5 genes 
# (to try it with all 10 genes, change the line below to gcol=4:13)
gcol=4:8 
ccol=1:3 # columns containing experimental conditions

# recalculating into molecule counts, reformatting
qs=cq2counts(data=beckham.data,genecols=gcol,
condcols=ccol,effic=beckham.eff,Cq1=37)

# creating a single factor, 'treatment.time', out of 'tr' and 'time'
qs$treatment.time=as.factor(paste(qs$tr,qs$time,sep="."))

# fitting a naive model
naive=mcmc.qpcr(
	fixed="treatment.time",
	data=qs,
	nitt=3000,burnin=2000 # remove this line in actual analysis!
)

#summary plot of inferred abundances
#s1=HPDsummary(model=naive,data=qs)

#summary plot of fold-changes relative to the global control
s0=HPDsummary(model=naive,data=qs,relative=TRUE)

# pairwise differences and their significances for each gene:
s0$geneWise




