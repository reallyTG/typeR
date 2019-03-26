library(spgs)


### Name: cylinder.counts
### Title: Count Cylinders (Fixed-Offset Patterns) in Character Vectors
### Aliases: cylinder.counts
### Keywords: array

### ** Examples

#Generate an IID uniform DNA sequence
seq <- simulateMarkovChain(5000, matrix(0.25, 4, 4), states=c("a","c","g","t"))
cylinder.counts(seq, 1) #essentially the same as unclass(table(seq))
cylinder.counts(seq, 1:5) #counts of all 5-mers in the sequence

 #counts of all patterns of the form a.b where a and b represent
 #specific symbols and . denotes an arbitrary symbol.
 pat <- cylinder.counts(seq, c(1, 3))
#For example, pat["a","c"] gives the number of times that any of 
#the following 4 words appears in the sequence:  aac, acc, agc, atc.
identical(cylinder.counts(seq, c(1,3)), apply(cylinder.counts(seq, 1:3), c(1, 3), sum))

##some relationships between cylinder.counts and other functionns
identical(cylinder.counts(seq, 1:2), pair.counts(seq))
identical(cylinder.counts(seq, 1:3), triple.counts(seq))
identical(cylinder.counts(seq, 1:4), quadruple.counts(seq))

#The following relationship means that counts on circular sequences are 
#invariant under translationn
identical(cylinder.counts(seq, 1:6), cylinder.counts(seq, 10:15))

#Treating seq as non circular, most of the preceding relationships continue to hold
identical(cylinder.counts(seq, 1:2, circular=FALSE), 
  pair.counts(seq, circular=FALSE))
identical(cylinder.counts(seq, 1:3, circular=FALSE), 
triple.counts(seq, circular=FALSE))
identical(cylinder.counts(seq, 1:4, circular=FALSE), 
  quadruple.counts(seq, circular=FALSE))
#The following relationship no longer holds; that is, non-circular counts
#are not invariant under translation.
identical(cylinder.counts(seq, 1:6, circular=FALSE), 
  cylinder.counts(seq, 10:15, circular=FALSE))



