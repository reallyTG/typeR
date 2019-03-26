library(matsbyname)


### Name: identize_byname
### Title: Named identity matrix or vector
### Aliases: identize_byname

### ** Examples

M <- matrix(1:16, ncol = 4, dimnames=list(c(paste0("i", 1:4)), paste0("c", 1:4))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
identize_byname(M)
identize_byname(M, margin = c(1,2))
identize_byname(M, margin = 1)
identize_byname(M, margin = 2)
N <- matrix(c(-21, -12, -21, -10), ncol = 2, dimnames = list(c("b", "a"), c("b", "a"))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
identize_byname(N)
# This also works with lists
identize_byname(list(M, M))



