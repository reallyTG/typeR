library(trotter)


### Name: apv
### Title: Amalgams Pseudo-Vector Constructor
### Aliases: amalgam amalgams apv

### ** Examples

# create a pseudo-vector of 10-amalgams from the first 15 letters
a <- apv(10, letters[1:15])
# generate a description
print(a)
# compatable with length
length(a)
# inspect a few of the combinations "stored" in a
a[1]
a[1000000]
a[576650390625]



