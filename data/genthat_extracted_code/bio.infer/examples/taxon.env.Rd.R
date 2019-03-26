library(bio.infer)


### Name: taxon.env
### Title: Estimate taxon-environment relationships
### Aliases: taxon.env
### Keywords: models

### ** Examples

data(envdata.OR)
data(bcnt.tax.OR)
coef <- taxon.env(~sed + sed^2, bcnt.tax.OR, envdata.OR, "SVN",
"CountValue", "STRM.ID")



