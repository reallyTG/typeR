library(dataPreparation)


### Name: whichAreInDouble
### Title: Identify double columns
### Aliases: whichAreInDouble

### ** Examples

# First let's build a matrix with 3 columns and a lot of lines, with 1's everywhere
M <- matrix(1, nrow = 1e6, ncol = 3)

# Now let's check which columns are equals
whichAreInDouble(M)
# It return 2 and 3: you should only keep column 1.

# Let's change the column 2, line 1 to 0. And check again
M[1, 2] <- 0
whichAreInDouble(M)
# It only returns 3

# What about NA? NA vs not NA => not equal
M[1, 2] <- NA
whichAreInDouble(M)
# It only returns 3

# What about NA?  Na vs NA => yep it's the same
M[1, 1] <- NA
whichAreInDouble(M)
# It only returns 2



