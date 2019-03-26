library(phylosim)


### Name: ==.Alphabet
### Title: Check if two alaphabet objects have the same symbol set
### Aliases: ==.Alphabet Alphabet.== ==,Alphabet-method !=.Alphabet

### ** Examples


	# create an alpahabet object
	a<-Alphabet(symbols=c(0,1));
	# clone object
	b<-clone(a)
	# compare the two objects
	print(a == b)
	# modify symbol set in b
	b$symbols<-c("AT","GC");
	print(a == b)

 


