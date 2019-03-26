library(apc)


### Name: apc.plot.data.sums
### Title: This plot shows sums of data matrix by age, period or cohort.
### Aliases: apc.plot.data.sums

### ** Examples

#####################
#  	EXAMPLE with artificial data
#  	Generate a 3x4 matrix in "AP" data.format with the numbers 1..12
#	Then make a data list
#	Then plot data sums.
#	Note only 3 plots are made as there are no doses

m.data  	<- matrix(data=seq(length.out=12),nrow=3,ncol=4)
m.data
data.list	<- apc.data.list(m.data,"AP")
apc.plot.data.sums(data.list)					 

#####################
#	EXAMPLE with Japanese breast cancer data
#	Make a data list
#	Then plot data sums for both responses and doses.

data.list	<- data.Japanese.breast.cancer()	
apc.plot.data.sums(data.list)					

# 	Or plot data sums for responses only

apc.plot.data.sums(data.list,data.type="r")		

#####################
#	EXAMPLE with asbestos data
#	Miranda Martinex, Nielsen and Nielsen (2013).
#	This is Figure 1,a-c 

data.list	<- data.asbestos()	
apc.plot.data.sums(data.list,type="l")



