library(kriens)


### Name: path
### Title: Compose all the function in a list
### Aliases: path

### ** Examples

# define a function that doubles its argument
times.two <- function(x, ret) {
  ret(x*2)
}

# define a function that loops over a list of list and double every element
loop <- forget(path(list(lapply, lapply, times.two)))

#returns list(list(2, 4, 6), list(8,10,12))
loop(list(list(1,2,3),list(4,5,6)))



