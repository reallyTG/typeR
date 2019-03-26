library(Blaunet)


### Name: nodal.global
### Title: Compute Blau statues for individuals across all niches
### Aliases: nodal.global

### ** Examples

data(TwoCities)
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp')
#will automatically call niches
b0 <- nodal.global(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions
#treat all individuals as in same ecology
b1 <- nodal.global(b, dev.range = rep(1.5, 10), ecologies.off = TRUE) 
# 10 is the number of dimensions in the command line above 




