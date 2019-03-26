library(meta)


### Name: metacor
### Title: Meta-analysis of correlations
### Aliases: metacor
### Keywords: htest

### ** Examples

m1 <- metacor(c(0.85, 0.7, 0.95), c(20, 40, 10))

#
# Print correlations (back transformed from Fisher's z transformation)
#
m1

#
# Print Fisher's z transformed correlations 
#
print(m1, backtransf=FALSE)

#
# Forest plot with back transformed correlations
#
forest(m1)

#
# Forest plot with Fisher's z transformed correlations
#
forest(m1, backtransf=FALSE)


m2 <- update(m1, sm="cor")
m2
# Identical forest plots (as back transformation is the identity transformation)
# forest(m2)
# forest(m2, backtransf=FALSE)



