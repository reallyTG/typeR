library(revtools)


### Name: bibliography-methods
### Title: Methods for class 'bibliography'
### Aliases: as.bibliography c.bibliography as.data.frame.bibliography
###   print.bibliography summary.bibliography [.bibliography
###   bibliography-methods

### ** Examples

# import some data
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location, return_df = FALSE)

# basic descriptions
summary(x)
print(x)
x[1]

# append two bibliography objects
y <- c(x[1:5], x[2:4])

# conversion to and from data.frame
y <- as.data.frame(x)
x_new <- as.bibliography(y)



