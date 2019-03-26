library(DescTools)


### Name: Unwhich
### Title: Inverse Which
### Aliases: Unwhich
### Keywords: attribute logic

### ** Examples

ll <- c(TRUE, FALSE, TRUE, NA, FALSE, FALSE, TRUE)
names(ll) <- letters[seq(ll)]
i <- which(ll)
# back again (loosing the names of the FALSEs)
Unwhich(i, length(ll))



