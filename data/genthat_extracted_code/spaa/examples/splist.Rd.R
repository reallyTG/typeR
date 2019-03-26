library(spaa)


### Name: splist
### Title: species list used in function add.col()
### Aliases: splist
### Keywords: datasets

### ** Examples


data(splist)
data(testdata)
## add genera from dataframe B to dataframe A.
add.col(inputA = testdata, inputB = splist, add = "genera",
according = "species")
## add family from dataframe B to dataframe A.
add.col(inputA = testdata, inputB = splist, add = "family", 
according = "species")




