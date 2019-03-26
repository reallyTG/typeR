library(matsbyname)


### Name: pow_byname
### Title: Powers of matrix elements
### Aliases: pow_byname

### ** Examples

library(dplyr)
pow_byname(2, 3)
m <- matrix(2, nrow = 2, ncol = 3, dimnames = list(paste0("r", 1:2), paste0("c", 1:3))) %>% 
  setrowtype("rows") %>% setcoltype("cols")
pow_byname(m, 2)
DF <- data.frame(m = I(list()), pow = I(list()))
DF[[1, "m"]] <- m
DF[[2, "m"]] <- m
DF[[1, "pow"]] <- 0.5
DF[[2, "pow"]] <- -1
DF %>% mutate(
  sqrtm = pow_byname(m, 0.5),
  mtopow = pow_byname(m, pow)
)



