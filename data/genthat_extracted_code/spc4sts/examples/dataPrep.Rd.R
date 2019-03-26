library(spc4sts)


### Name: dataPrep
### Title: Neighborhood Data Preparation
### Aliases: dataPrep

### ** Examples

## construct a neighborhood data for an unrealistically small mock image (7x9 pixels).
mock.img <- matrix(sample(0:255,63), 7, 9)
mock.img
dataPrep(img = mock.img, nb = 2) # the same with nb = c(2, 2, 2)

## select only columns "V2", "V5", and "V13" in the output
dataPrep(img = mock.img, nb = 2, vars = c("V2", "V5", "V13"))

## return only a half number of rows
dataPrep(img = mock.img, nb = 2, subsample = .5)



