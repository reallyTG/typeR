library(phylosim)


### Name: is.GeneralInDel
### Title: Check if an object inherits from the GeneralInDel class
### Aliases: is.GeneralInDel.default is.GeneralInDel

### ** Examples

	# create some objects
	o<-GeneralInDel(rate=1, propose.by=function(process){sample(c(1:10),1)});
	x<-GTR()
	# check if they inherit from GeneralInDel
	is.GeneralInDel(o)
	is.GeneralInDel(x)
 


