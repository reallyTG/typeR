library(MCPAN)


### Name: poly3table
### Title: Summarize long term carcinogenicity data
### Aliases: poly3table
### Keywords: print

### ** Examples

data(methyl)
methyl
poly3table(time=methyl$death, status=methyl$tumour,
 f=methyl$group, tumour = 1, symbol = "*")




