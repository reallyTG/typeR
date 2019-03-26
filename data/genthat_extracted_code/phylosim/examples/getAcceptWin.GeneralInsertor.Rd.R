library(phylosim)


### Name: getAcceptWin.GeneralInsertor
### Title: Get the size of the acceptance window
### Aliases: getAcceptWin.GeneralInsertor GeneralInsertor.getAcceptWin
###   getAcceptWin,GeneralInsertor-method

### ** Examples

	# create a GeneralInsertor object
	i<-GeneralInsertor(rate=0.5);
	# get acceptance window size
	getAcceptWin(i)
	# get acceptance window size via virtual field
	i$acceptWin
	# set acceptance window size
	setAcceptWin(i,2)
	# set acceptance window size via virtual field
	i$acceptWin<-3
	i$acceptWin
 


