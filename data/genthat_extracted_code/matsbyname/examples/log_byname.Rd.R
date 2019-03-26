library(matsbyname)


### Name: log_byname
### Title: Logarithm of matrix elements
### Aliases: log_byname

### ** Examples

log_byname(exp(1))
m <- matrix(c(10,1,1,100), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
  setrowtype("Industry") %>% setcoltype("Commodity")
log_byname(m)
log_byname(m, base = 10)



