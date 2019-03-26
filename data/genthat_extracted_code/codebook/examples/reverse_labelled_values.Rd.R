library(codebook)


### Name: reverse_labelled_values
### Title: Reverse labelled values reverse the underlying values for a
###   numeric 'haven::labelled()' vector while keeping the labels correct
### Aliases: reverse_labelled_values

### ** Examples

x <- haven::labelled(rep(1:3, each = 3), c(Bad = 1, Good = 5))
x
reverse_labelled_values(x)



