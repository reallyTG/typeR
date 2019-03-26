library(trotter)


### Name: spv
### Title: Selections Pseudo-Vector Constructor
### Aliases: selection selections spv

### ** Examples

# create a pseudo-vector of 10-selections from the first 15 letters
s <- spv(10, letters[1:15])
# generate a description
print(s)
# compatable with length
length(s)
# inspect a few of the combinations "stored" in s
s[1]
s[1000]
s[1961256]



