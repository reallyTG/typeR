library(purrr)


### Name: splice
### Title: Splice objects and lists of objects into a list
### Aliases: splice

### ** Examples

inputs <- list(arg1 = "a", arg2 = "b")

# splice() concatenates the elements of inputs with arg3
splice(inputs, arg3 = c("c1", "c2")) %>% str()
list(inputs, arg3 = c("c1", "c2")) %>% str()
c(inputs, arg3 = c("c1", "c2")) %>% str()



