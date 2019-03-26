library(corTools)


### Name: traitcombos
### Title: Trait combination calculator
### Aliases: traitcombos

### ** Examples

# Create a sample dataset
ids <- c(1, 2, 3, 4, 5)
Trait1 <- c(23, 43, 46, 74, 42)
Trait2 <- c(32, 56, 72, 56, 97)
Trait3 <- c(42, 54, 77, 92, 40)
dat <- as.data.frame(cbind(ids, Trait1, Trait2, Trait3))

traitcombos(dat, "ids")
# dat denotes the name of the dataframe
# ids is the name of the ID column
# function returns dataset with additional columns added, where the column names
# are the trait combinations and the column values are the appropriate trait calculations



