library(phylosim)


### Name: Alphabet
### Title: The Alphabet class
### Aliases: Alphabet

### ** Examples

		# create an alphabet object
		a<-Alphabet(type="Binary",symbols=c("0","1"));
		# print summary
		summary(a);
		# change the identifier
		a$type<-"Nucleotide";
		# change the symbol set
		a$symbols<-c("A","T","G","C");
		# print summary again
		summary(a);
		# clone the alphabet object
		b<-clone(a);
		# test the equality of the symbol sets
		a == b;
 


