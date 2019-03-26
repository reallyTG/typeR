library(apc)


### Name: apc.get.index
### Title: Get indices for mapping data into trapezoid formation
### Aliases: apc.get.index

### ** Examples

################
#	Artificial data

###############
#	Artificial data
#	Generate a 3x5 matrix and make arbitrary decisions for rest

response <- matrix(data=seq(1:15),nrow=3,ncol=5)
data.list	<- list(response=response,dose=NULL,data.format="AP",
					age1=25,per1=1955,coh1=NULL,
					unit=5,per.zero=NULL,per.max=NULL,time.adjust=0)
apc.get.index(data.list)




