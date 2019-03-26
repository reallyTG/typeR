library(fingerprint)


### Name: as.character
### Title: Generates a String Representation of a Fingerprint
### Aliases: as.character as.character,fingerprint-method
###   as.character,featvec-method as.character,feature-method
### Keywords: logic methods

### ** Examples

# make a fingerprint vector
fp <- new("fingerprint", nbit=32, bits=sample(1:32, 20))

# print out the string representation
as.character(fp)



