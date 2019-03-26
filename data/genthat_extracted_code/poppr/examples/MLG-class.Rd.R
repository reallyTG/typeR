library(poppr)


### Name: MLG-class
### Title: MLG class
### Aliases: MLG-class MLG
### Keywords: internal

### ** Examples


# These examples will simply show you what you can do with these
set.seed(5000)
(x <- sample(10, 20, replace = TRUE))
(m <- new("MLG", x))

 visible(m) # original is always default
 
 m[]       # adding braces after the object will always return a vector of 
           # the same type as defined in "visible"
           
 m + 1     # You can do math on the numeric ones
 
 visible(m) <- "custom"
 m + 2     # This should throw a warning
 # The types are stored in a data frame. You can retrieve them easily:
 visible(m) <- "original"
 m
 m[, "custom"]
 
 # Important for subsetting, if you subset the object, normally, it will 
 # return a vector unless you specify all = TRUE
 m[1:10]             # original vector
 m[1:10, all = TRUE] # still class MLG




