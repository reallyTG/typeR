library(SUMMER)


### Name: ChangeRegion
### Title: Function to map region names to a common set.
### Aliases: ChangeRegion

### ** Examples


# Construct a small test data
testdata <- data.frame(region = c("north", "south", "east",
 "south", "east"), index = c(1:5))

# Construct a changing rule: combining south and east
Bmat <- matrix(c(1, 0, 0, 0, 1, 1), 3, 2)
colnames(Bmat) <- c("north", "south and east")
rownames(Bmat) <- c("north", "south", "east")
print(Bmat)

# New data after transformation
test <- ChangeRegion(testdata, Bmat, "region")
print(test)



