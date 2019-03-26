library(Smisc)


### Name: sepList
### Title: Separate a list into distinct objects
### Aliases: sepList

### ** Examples

# Simplest way to use sepList()
aList <- list(a = 1:10,  b = letters[1:5], d = TRUE)
sepList(aList)
ls()
a
b
d

# Keeping the object names, and listing them via "verbose"
objs <- sepList(list(1:5, c("bits", "bytes"), c(TRUE, FALSE)), verbose = TRUE)
objs
o1
o2
o3

# Note that it doesn't recurse into sublists, only the top level object
# a and b are created
sepList(list(a = 1:2, b = list(b1 = 5, b2 = FALSE)), verbose = TRUE)

# Separate the original list inside a function, notice where the objects are written
sepTest <- function(x) {

 # Keep objects inside the local environment
 cat("Objects in the local environment before separating the list:\n")
 print(ls())

 sepList(x)

 cat("Objects in the local environment after separating the list:\n")
 print(ls())

 # Place objects in the global environment instead
 cat("Objects in the global environment before separating the list:\n")
 print(ls(.GlobalEnv))

 sepList(x, envir = .GlobalEnv)

 cat("Objects in the local environment after separating the list:\n")
 print(ls(.GlobalEnv))

} # sepTest

sepTest(list(z1 = 10, z2 = "that"))

# Clean up example objects
rm(aList, a, b, d, objs, o1, o2, o3, sepTest, z1, z2)



