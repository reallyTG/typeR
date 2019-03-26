library(Smisc)


### Name: loadObject
### Title: Loads and returns the object(s) in one or more ".Rdata" files
### Aliases: loadObject

### ** Examples

# Create some filenames we'll use in this example
fileName1 <- "demo_load_object_1.Rdata"
fileName2 <- "demo_load_object_2.Rdata"

# Make an example object
x <- data.frame(a = 1:10, b = rnorm(10))

# Save and reload the file
save(x, file = fileName1)
rm(x)
y <- loadObject(fileName1)

# Note how 'x' is not in the global environment
ls()

# This is the object that was in 'fileName'
print(y)

# Here's an example with two objects saved in a single file
a <- rnorm(10)
b <- rnorm(20)
save(a, b, file = fileName2)

# Load the results and show them
z <- loadObject(fileName2)
print(z)

# And here's an example with more than one file
both <- loadObject(c(fileName1, fileName2))
both

# Delete the files
unlink(c(fileName1, fileName2))



