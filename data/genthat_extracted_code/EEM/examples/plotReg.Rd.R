library(EEM)


### Name: plotReg
### Title: Plot regression coefficients for EEM data
### Aliases: plotReg

### ** Examples

data(gluten)
gluten_uf <- unfold(gluten) # unfold list into matrix

# delete columns with NA values
index <- colSums(is.na(gluten_uf)) == 0
gluten_uf <- gluten_uf[, index]
gluten_ratio <- as.numeric(names(gluten))

require(pls)
model <- plsr(gluten_ratio ~ gluten_uf, ncomp = 3) 
plotReg(model) 
 



