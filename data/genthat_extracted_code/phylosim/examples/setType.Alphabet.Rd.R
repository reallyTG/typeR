library(phylosim)


### Name: setType.Alphabet
### Title: Set Alphabet object type
### Aliases: setType.Alphabet Alphabet.setType setType,Alphabet-method

### ** Examples

	# create an alphabet object
	a<-Alphabet(symbols=c(1,2,3))
	# set a new type
	setType(a,"MyAlphabet")
	a$type
	# set type via virtual field
	a$type<-"MorphChars"
 


