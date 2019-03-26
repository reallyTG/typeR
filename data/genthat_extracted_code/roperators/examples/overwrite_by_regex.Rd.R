library(roperators)


### Name: %regex=%
### Title: Modify existing object by regular expression
### Aliases: %regex=%

### ** Examples

# Apply a regular expression/substitution to x:

 x <- c("a1b", "b1", "c", "d0")

 # change any number to "x"

  x %regex=% c("\\d+", "x")

 print(x)

 # "axb" "b" "c" "dx"



