library(trotter)


### Name: cpv
### Title: Combinations Pseudo-Vector Constructor
### Aliases: combination combinations cpv

### ** Examples

# create a pseudo-vector of 10-combinations from the first 15 letters
c <- cpv(10, letters[1:15])
# generate a description
print(c)
# compatable with length
length(c)
# inspect a few of the combinations "stored" in c
c[1]
c[1000]
c[3003]



