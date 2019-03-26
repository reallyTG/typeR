library(MCMC.qpcr)


### Name: outlierSamples
### Title: detects outlier samples in qPCR data
### Aliases: outlierSamples

### ** Examples

# loading Cq data and amplification efficiencies
data(coral.stress) 
data(amp.eff) 
# extracting a subset of data 
cs.short=subset(coral.stress, timepoint=="one")

genecolumns=c(5,6,16,17) # specifying columns corresponding to genes of interest
conditions=c(1:4) # specifying columns containing factors  

# calculating molecule counts and reformatting:
dd=cq2counts(data=cs.short,genecols=genecolumns,
condcols=conditions,effic=amp.eff,Cq1=37) 

# fitting the model
mm=mcmc.qpcr(
	fixed="condition",
	data=dd,
	controls=c("nd5","rpl11"),
	nitt=4000, # remove this line when analyzing real data!
	pr=TRUE
)

# detecting outliers
outliers=outlierSamples(mm,dd)

# removing outliers
dd=dd[!(dd$sample %in% outliers),]




