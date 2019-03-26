library(svMisc)


### Name: def
### Title: Define a vector of a given mode and length (possibly filling it
###   with default values)
### Aliases: def
### Keywords: utilities

### ** Examples

def(1:3, length.out = 5)                      # Convert into character and recycle
def(0:2, mode = "logical")                    # Numbers to logical
def(c("TRUE", "FALSE"), mode = "logical")     # Text to logical
def(NULL, "default text")                     # Default value used
def(character(0), "default text")             # Idem
def(NA, 10, mode = "numeric", length.out = 2) # Vector of two numbers



