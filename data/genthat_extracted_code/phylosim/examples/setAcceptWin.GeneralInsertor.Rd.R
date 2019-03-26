library(phylosim)


### Name: setAcceptWin.GeneralInsertor
### Title: Set the size of the acceptance window
### Aliases: setAcceptWin.GeneralInsertor GeneralInsertor.setAcceptWin
###   setAcceptWin,GeneralInsertor-method

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
 


