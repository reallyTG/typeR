library(spaa)


### Name: add.col
### Title: Add one column from A to B, according to one column of common
###   name.
### Aliases: add.col
### Keywords: add

### ** Examples


data(splist)
data(testdata)
## add genera from dataframe B to dataframe A.
add.col(inputA = testdata, inputB = splist, add = "genera",
according = "species")
## add family from dataframe B to dataframe A.
add.col(inputA = testdata, inputB = splist, add = "family", 
according = "species")




