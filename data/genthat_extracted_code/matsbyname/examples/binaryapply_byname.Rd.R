library(matsbyname)


### Name: binaryapply_byname
### Title: Apply a binary function "by name"
### Aliases: binaryapply_byname

### ** Examples

productnames <- c("p1", "p2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
  setrowtype("Products") %>% setcoltype("Industries")
Y <- matrix(1:4, ncol = 2, dimnames = list(rev(productnames), rev(industrynames))) %>%
  setrowtype("Products") %>% setcoltype("Industries")
sum_byname(U, Y)
binaryapply_byname(`+`, U, Y)



