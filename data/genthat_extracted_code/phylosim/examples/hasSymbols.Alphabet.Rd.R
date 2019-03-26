library(phylosim)


### Name: hasSymbols.Alphabet
### Title: Check if an Alphabet object has a given set of symbols
### Aliases: hasSymbols.Alphabet Alphabet.hasSymbols
###   hasSymbols,Alphabet-method

### ** Examples


	# create alphabet object
	a<-Alphabet(symbols=c("A","T","G","C"));
	# check if it has the symbols "A" and "G"
	hasSymbols(a,c("A","G"))
	# check if has the symbol "X"
	hasSymbols(a,"X")
	# any alphabet returns true for every symbol
	b<-AnyAlphabet();
	hasSymbols(b,"X")

 


