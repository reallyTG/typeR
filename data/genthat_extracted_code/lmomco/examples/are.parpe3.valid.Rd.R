library(lmomco)


### Name: are.parpe3.valid
### Title: Are the Distribution Parameters Consistent with the Pearson Type
###   III Distribution
### Aliases: are.parpe3.valid
### Keywords: utility (distribution) Distribution: Pearson Type III utility
###   (distribution, parameter validation)

### ** Examples

para <- parpe3(lmoms(c(123,34,4,654,37,78)))
if(are.parpe3.valid(para)) Q <- quape3(0.5,para)



