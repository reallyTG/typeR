library(phylosim)


### Name: setSymbols.Alphabet
### Title: Specify a new symbol set for an Alphabet object
### Aliases: setSymbols.Alphabet Alphabet.setSymbols
###   setSymbols,Alphabet-method

### ** Examples


	# create a new alphabet object
	a<-Alphabet()
	a
	# specify a new symbol set
	setSymbols(a,c(0,1))
	a
	# the same, but now use the virtual field
	a$symbols<-c("A","T","G","C")
	a

 


