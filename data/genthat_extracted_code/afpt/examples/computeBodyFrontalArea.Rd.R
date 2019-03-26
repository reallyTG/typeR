library(afpt)


### Name: computeBodyFrontalArea
### Title: Body frontal area from scaling relation
### Aliases: computeBodyFrontalArea

### ** Examples

massEmpty <- 0.215 # kg
Sb <- computeBodyFrontalArea(massEmpty)
print(Sb)
#   [1] 0.002920751 # m2

massEmpty <- 0.215 # kg
birdType <- "passerine" #
Sb <- computeBodyFrontalArea(massEmpty,birdType)
print(Sb)
#   [1] 0.005020037 # m2



