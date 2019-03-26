library(mefa)


### Name: label
### Title: Assign Label to an Object and Return It
### Aliases: label label<-
### Keywords: manip

### ** Examples

x <- 1:10
x
## Assign a character
label(x) <- "x is a vector"
x
## Get back the label
label(x)
## Note the effect of deparsing
label(x) <- 1:10
label(x)



