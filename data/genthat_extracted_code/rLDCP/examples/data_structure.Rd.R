library(rLDCP)


### Name: data_structure
### Title: Define the data structure
### Aliases: data_structure

### ** Examples


values <- matrix(c(34,11,9,32), ncol=2)

my_method <- function (input){
 output <- c(mean(input[,1]), mean(input[,2]))
 output
}
 my_data_structure <- data_structure(values,my_method)



