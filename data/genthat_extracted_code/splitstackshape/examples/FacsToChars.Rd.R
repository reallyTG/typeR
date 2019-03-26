library(splitstackshape)


### Name: FacsToChars
### Title: Convert All Factor Columns to Character Columns
### Aliases: FacsToChars

### ** Examples


## Some example data
dat <- data.frame(title = c("title1", "title2", "title3"),
         author = c("author1", "author2", "author3"),
         customerID = c(1, 2, 1))

str(dat) # current structure
dat2 <- splitstackshape:::FacsToChars(dat)
str(dat2) # Your new object
str(dat)  # Original object is unaffected




