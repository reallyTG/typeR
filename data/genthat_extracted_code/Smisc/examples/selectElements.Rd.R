library(Smisc)


### Name: selectElements
### Title: Validate selected elements from a character vector
### Aliases: selectElements

### ** Examples

# Define some "column names"
cnames <- letters[1:5]
cnames

# Select the 1st and 3rd column names using a variety of approaches
selectElements(c("a", "c"), cnames)
selectElements(c(1, 3), cnames)
selectElements(c(TRUE, FALSE, TRUE, FALSE, FALSE), cnames)

# Select the 1st, 3rd, and 1st columns
selectElements(c("a", "c", "a"), cnames)
selectElements(c(1, 3, 1), cnames)

# If you don't want to select any of them
selectElements(NULL, cnames)



