library(multicon)


### Name: partwhole
### Title: Part-Whole Correlation
### Aliases: partwhole
### Keywords: part-whole correlation composite

### ** Examples

data(bfi.set)
  # Imagine we want to find the best two-item composite that correlates
  # highest with the full 8 items available to measure extraversion. 
  # Three (of the extraversion) items need to be reverse scored
sBFI6r <- 6 - bfi.set$sBFI6
sBFI21r <- 6 - bfi.set$sBFI21
sBFI31r <- 6 - bfi.set$sBFI31
  # Now put them all into one data.frame
ext.vars <- data.frame(bfi.set$sBFI1, sBFI6r, bfi.set$sBFI11, 
	bfi.set$sBFI16, sBFI21r, bfi.set$sBFI26, sBFI31r, bfi.set$sBFI36)
head(ext.vars) # Looks good
  # Now compute the parwhole correlation for all possible 2-item composites
partwhole(ext.vars, 2)



