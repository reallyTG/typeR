library(forestmangr)


### Name: inv
### Title: Calculate the inverse of a number
### Aliases: inv

### ** Examples

library(forestmangr)
data("exfm15")
exfm15

# Get the inverse of a vector
inv(iris$Petal.Length)

# Fit a model that contains the inverse of a variable, without the need to
# create a new variable for the inverse:
lm(log(TH) ~ inv(DBH), exfm15 )
# or 
lm_table(exfm15, log(TH) ~ inv(DBH) )




