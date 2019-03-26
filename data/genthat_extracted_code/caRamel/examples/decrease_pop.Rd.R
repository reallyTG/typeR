library(caRamel)


### Name: decrease_pop
### Title: decrease_pop
### Aliases: decrease_pop

### ** Examples

# Definition of the parameters
matobj <- matrix(rexp(200), 100, 2)
prec <- c(1.e-3, 1.e-3)
archsize <- 100
minmax <- c(FALSE, FALSE)
popsize <- 100
# Call the function
res <- decrease_pop(matobj, minmax, prec, archsize, popsize)




