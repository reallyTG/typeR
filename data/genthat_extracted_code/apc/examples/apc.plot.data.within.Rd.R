library(apc)


### Name: apc.plot.data.within
### Title: This plot shows time series of matrix within age, period or
###   cohort.
### Aliases: apc.plot.data.within apc.plot.data.within.all.six

### ** Examples

#####################
#  	EXAMPLE with artificial data
#  	Generate a 3x4 matrix in "AP" data.format with the numbers 1..12
#	Then make a data list
#	Then plot data.
#  	Note: this deterministic matrix has neither age, period, or cohort factors,
#		 only linear trends.  Thus all 6 plots have parallel lines.	

m.data  	<- matrix(data=seq(length.out=12),nrow=3,ncol=4)
m.data
data.list	<- apc.data.list(m.data,"AP")
apc.plot.data.within(data.list,log="")

#	It also works with a single argument, but then a default log scale is used.

apc.plot.data.within(data.list)			

#####################
#	EXAMPLE with Japanese breast cancer data
#	Clayton and Shifflers (1987b) use APC design
#	Make a data list
#	Then plot data.
#	Note: No plot appears to have approximately parallel lines.

data.list	<- data.Japanese.breast.cancer()	
apc.plot.data.within(data.list,"m",1,log="y")
												
#	It also works with a single argument, but then a default log scale is used.
# 	Note that warnings are given in relation to the data chosen thinning

apc.plot.data.within(data.list)

#####################
#	EXAMPLE with Italian bladder cancer data
#	Clayton and Shifflers (1987a) use AC design
#	Note: plot of within cohort against age appears to have approximately parallel lines.
#		  This is Figure 2 in Clayton and Shifflers (1987a)
#	Note: plot of within age against cohort appears to have approximately parallel lines.
#		  Indicates that interpretation should be done carefully.

data.list	<- data.Italian.bladder.cancer()	
apc.plot.data.within(data.list,"m",1,log="y")

#####################
#	EXAMPLE with asbestos data
#	Miranda Martinex, Nielsen and Nielsen (2014).
#	This is Figure 1d 

data.list	<- data.asbestos()	
apc.plot.data.within(data.list,type="l",lty=1)



