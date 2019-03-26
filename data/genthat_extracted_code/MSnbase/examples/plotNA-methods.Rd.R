library(MSnbase)


### Name: plotNA-methods
### Title: Exploring missing data in 'MSnSet' instances
### Aliases: plotNA-methods plotNA,MSnSet-method plotNA,matrix-method
###   plotNA is.na.MSnSet
### Keywords: methods

### ** Examples

data(msnset)
exprs(msnset)[sample(prod(dim(msnset)), 120)] <- NA

head(is.na(msnset))
table(is.na(msnset))
image(msnset)

plotNA(msnset, pNA = 1/4)



