library(apc)


### Name: apc.data.list.subset
### Title: Cut age, period and cohort groups from data set.
### Aliases: apc.data.list.subset

### ** Examples

###############
#	Artificial data
#	Generate a 5x7 matrix and make arbitrary decisions for rest

response <- matrix(data=seq(1:35),nrow=5,ncol=7)
data.list	<- list(response=response,dose=NULL,data.format="AP",
					age1=25,per1=1955,coh1=NULL,unit=5,
					per.zero=NULL,per.max=NULL,time.adjust=0)
data.list

apc.data.list.subset(data.list,1,1,0,0,0,0)





