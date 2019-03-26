library(phylosim)


### Name: checkConsistency.Alphabet
### Title: Check object consistency
### Aliases: checkConsistency.Alphabet Alphabet.checkConsistency
###   checkConsistency,Alphabet-method

### ** Examples

		# create an alphabet object
		a<-Alphabet(symbols=c(0,1));
		# check consistency
		print(checkConsistency(a));
		# mess up with the internals
		a$.symbols[1]<-"BAD";
		# NOT run: cosistency check now will throw an error
		## Not run:  print(checkConsistency(a)); 

 


