library(MCMC.qpcr)


### Name: getNormalizedData
### Title: Extracts qPCR model predictions
### Aliases: getNormalizedData

### ** Examples

library(MCMC.qpcr)

# loading Cq data and amplification efficiencies
data(coral.stress) 
data(amp.eff) 

genecolumns=c(5,6,16,17) # specifying columns corresponding to genes of interest
conditions=c(1:4) # specifying columns containing factors  

# calculating molecule counts and reformatting:
dd=cq2counts(data=coral.stress,genecols=genecolumns,
condcols=conditions,effic=amp.eff,Cq1=37) 

# fitting the model (must include random="sample", pr=TRUE options)
mm=mcmc.qpcr(
	fixed="condition",
	data=dd,
	controls=c("nd5","rpl11"),
	nitt=4000,
	pr=TRUE,
	random="sample"
)

# extracting model predictions
pp=getNormalizedData(mm,dd)

# here is the normalized data:
pp$normData

# and here are the corresponding conditions:
pp$conditions

# putting them together for plotting:
ppcombo=cbind(stack(pp$normData),rep(pp$conditions))
names(ppcombo)[1:2]=c("expression","gene")

# plotting boxplots of normalized data:
ggplot(ppcombo,aes(condition,expression,colour=timepoint))+
	geom_boxplot()+
	facet_wrap(~gene,scales="free")+
	theme_bw()



