library(MCMC.qpcr)


### Name: trellisByGene
### Title: For two-way designs, plots mcmc.qpcr model predictions gene by
###   gene
### Aliases: trellisByGene

### ** Examples


# loading Cq data and amplification efficiencies
data(coral.stress) 
data(amp.eff) 

genecolumns=c(5,6,16,17) # specifying columns corresponding to genes of interest
conditions=c(1:4) # specifying columns containing factors  

# calculating molecule counts and reformatting:
dd=cq2counts(data=coral.stress,genecols=genecolumns,
condcols=conditions,effic=amp.eff,Cq1=37) 

# fitting the 2-way model
mm=mcmc.qpcr(
	fixed="condition+timepoint+condition:timepoint",
	data=dd,
	nitt=4000 # remark this line to analyze real data!
)

# summarizing results
ss=HPDsummary(mm,data=dd,summ.plot=FALSE)

# plotting predicted means and 95% CIs gene by gene
trellisByGene(ss,xFactor="condition",groupFactor="timepoint")



