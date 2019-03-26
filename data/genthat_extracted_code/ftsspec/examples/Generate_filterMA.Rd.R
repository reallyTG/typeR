library(ftsspec)


### Name: Generate_filterMA
### Title: Generate the Filter of a multivariate MA process
### Aliases: Generate_filterMA

### ** Examples

ma.scale1=c(-1.4,2.3,-2)
a1=Generate_filterMA(10, 10, MA.len=3, ma.scale=ma.scale1, seed=10)
str(a1)
rm(a1)



