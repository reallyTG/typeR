library(apc)


### Name: data.asbestos
### Title: Asbestos data
### Aliases: data.asbestos data.asbestos.2013 data.asbestos.2013.women
###   data.asbestos.2013.men

### ** Examples

#########################
#	apc data list

data.list	<- data.asbestos()
objects(data.list)

#####################
#	Figure 1,a-c from
#	Miranda Martinex, Nielsen and Nielsen (2015).

data.list	<- data.asbestos()	
apc.plot.data.sums(data.list,type="l")

#####################
#	Figure 1,d from
#	Miranda Martinex, Nielsen and Nielsen (2015).
data.list	<- data.asbestos()	
apc.plot.data.within(data.list,type="l",lty=1)




