library(TreeBUGS)


### Name: testHetChi
### Title: Chi-Square Test of Heterogeneity
### Aliases: testHetChi

### ** Examples

# some made up frequencies:
freq <- matrix(c(13,16,11,13,
                 15,21,18,13,
                 21,14,16,17,
                 19,20,21,18),
               ncol=4, byrow=TRUE)
# for a product-binomial distribution:
# (categories 1 and 2 and categories 3 and 4 are binomials)
testHetChi(freq, tree = c(1,1,2,2))
# => no significant deviation from homogeneity (low power!)



