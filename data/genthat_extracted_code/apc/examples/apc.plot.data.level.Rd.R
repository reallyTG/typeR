library(apc)


### Name: apc.plot.data.level
### Title: Level plot of data matrix.
### Aliases: apc.plot.data.level

### ** Examples


#####################
#	EXAMPLE with Japanese breast cancer data
#	Clayton and Shifflers (1987b) use APC design
#	Make a data list
#	Then plot data.
#	Note: No plot appears to have approximately parallel lines.

data.list	<- data.Japanese.breast.cancer()
apc.plot.data.level(data.list,"r")
dev.new()
apc.plot.data.level(data.list,"d",contour=TRUE)
												
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



