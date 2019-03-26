library(hsphase)


### Name: imageplot
### Title: Image Plot of Blocking Structure
### Aliases: imageplot
### Keywords: block image

### ** Examples

genotype <- matrix(c(
0,2,1,1,1,
2,0,1,2,2,
2,2,1,0,2,
2,2,1,1,1,
0,0,2,1,0), ncol = 5, byrow = TRUE) # each row contains the SNP of individuals
imageplot(bmh(genotype))



