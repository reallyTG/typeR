library(decompr)


### Name: decomp
### Title: Interface function for decompositions
### Aliases: decomp

### ** Examples

# load leather example data
data(leather)

# explore the data set
ls()

# explore each of the objects
inter
final
countries
industries
out

# use the direct approach

# run the Leontief decomposition
decomp(inter,
       final,
       countries,
       industries,
       out,
       method = "leontief")

# run the WWZ decomposition
decomp(inter,
       final,
       countries,
       industries,
       out,
       method = "wwz")



