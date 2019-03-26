library(ClusteredMutations)


### Name: features
### Title: Describe the features of mutation in the hyper-mutated zones.
### Aliases: features

### ** Examples

data(PD4107a)
###Show the features of mutations in the hypermutated zones;
features(data=PD4107a,chr=Chr,position=Position,refbase=Ref_base,
		mutantbase=Mutant_base)

###Locate complex mutations in the hypermutated zones;
kataegis<-features(data=PD4107a,chr=Chr,position=Position,refbase=Ref_base,
		mutantbase=Mutant_base)
complex <-features(data=PD4107a,chr=Chr,position=Position,
			refbase=Ref_base,mutantbase=Mutant_base,min=2,max=10)
sub.complex <-subset(complex,select=c(clustered,chr,position))
data.hyperm  <-merge(kataegis,sub.complex,by=c("chr","position"),all.x=TRUE) 

###Summary of the number of complex mutations in the hypermutated zones;
table(data.hyperm$clustered.x)
table(data.hyperm$clustered.y)
table(data.hyperm$clustered.y,data.hyperm$clustered.x)
data.hyperm<-transform(data.hyperm,clustered = 
				ifelse(is.na(clustered.y)==FALSE,1,0))
table(data.hyperm$clustered.x)
table(data.hyperm$clustered,data.hyperm$clustered.x)
###All hypermutated zones had more than 6 mutations (without complex mutations).



