library(multicon)


### Name: splithalf.r
### Title: Split-half Correlation and Reliability
### Aliases: splithalf.r
### Keywords: split-half reliability

### ** Examples

data(bfi.set)
  # Imagine we are forming a composite extraversion variable from the eight
  # extraversion items in BFI.set 
  # Three items need to be reverse scored
sBFI6r <- 6 - bfi.set$sBFI6
sBFI21r <- 6 - bfi.set$sBFI21
sBFI31r <- 6 - bfi.set$sBFI31
  # Now put them all into one data.frame
ext.vars <- data.frame(bfi.set$sBFI1, sBFI6r, bfi.set$sBFI11, 
	bfi.set$sBFI16, sBFI21r, bfi.set$sBFI26, sBFI31r, bfi.set$sBFI36)
head(ext.vars) # Looks good
  # Now compute the splithalf reliability for a possible composite
splithalf.r(ext.vars, sims=100) # Note in practice sims = 1000 or more might be preffered
  # Should be close to the value resulting from alpha
alpha.cov(cov(ext.vars, use="p"))
  # Getting the 'exact' splithalf correlation and reliability
  # by computing the splithalf correlation for all possible halves
  # (for comparison purposes)
combs <- combn(8,4)
out <- rep(NA, ncol(combs))
for(i in 1:ncol(combs)) {
  c1 <- composite(ext.vars[,combs[,i]])
  c2 <- composite(ext.vars[,-c(combs[,i])])
  out[i] <- cor(c1,c2)
}
mean(out)             # Exact splithalf correlation
mean(out*2/(out+1))   # Exact splithalf reliability



