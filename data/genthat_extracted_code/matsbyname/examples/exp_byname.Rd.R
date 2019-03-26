library(matsbyname)


### Name: exp_byname
### Title: Exponential of matrix elements
### Aliases: exp_byname

### ** Examples

exp_byname(1)
m <- matrix(c(log(10),log(1),log(1),log(100)), 
  nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
  setrowtype("Industry") %>% setcoltype("Commodity")
exp_byname(m)



