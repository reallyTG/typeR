library(trotter)


### Name: sspv
### Title: Subsets Pseudo-Vector Constructor
### Aliases: sspv subsets

### ** Examples

# create a pseudo-vector of subsets from the first 15 letters
ss <- sspv(letters[1:15])
# generate a description
print(ss)
# compatable with length
length(ss)
# inspect a few of the combinations "stored" in ss
ss[1]
ss[1000]
ss[32768]



