library(netdiffuseR)


### Name: diffnet-arithmetic
### Title: 'diffnet' Arithmetic and Logical Operators
### Aliases: diffnet-arithmetic ^.diffnet graph_power /.diffnet -.diffnet
###   *.diffnet &.diffnet |.diffnet

### ** Examples

# Computing two-steps away threshold with the Brazilian farmers data --------
data(brfarmersDiffNet)

expo1 <- threshold(brfarmersDiffNet)
expo2 <- threshold(brfarmersDiffNet^2)

# Computing correlation
cor(expo1,expo2)

# Drawing a qqplot
qqplot(expo1, expo2)

# Working with inverse ------------------------------------------------------
brf2_step <- brfarmersDiffNet^2
brf2_step <- 1/brf2_step

# Removing the first 3 vertex of medInnovationsDiffnet ----------------------
data(medInnovationsDiffNet)

# Using a diffnet object
first3Diffnet <- medInnovationsDiffNet[1:3,,]
medInnovationsDiffNet - first3Diffnet

# Using indexes
medInnovationsDiffNet - 1:3

# Using ids
medInnovationsDiffNet - as.character(1001:1003)



