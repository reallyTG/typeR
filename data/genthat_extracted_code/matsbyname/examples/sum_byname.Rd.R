library(matsbyname)


### Name: sum_byname
### Title: Name-wise addition of matrices
### Aliases: sum_byname

### ** Examples

library(dplyr)
sum_byname(2, 2)
sum_byname(2, 2, 2)
sum_byname(2, 2, -2, -2)
productnames <- c("p1", "p2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
  setrowtype("Products") %>% setcoltype("Industries")
Y <- matrix(1:4, ncol = 2, dimnames = list(rev(productnames), rev(industrynames))) %>%
  setrowtype("Products") %>% setcoltype("Industries")
sum_byname(U, 100)
sum_byname(200, Y)
U + Y # Non-sensical.  Row and column names not respected.
sum_byname(U, U)
sum_byname(U, Y)
sum_byname(U, U, Y, Y)
V <- matrix(1:4, ncol = 2, dimnames = list(industrynames, productnames)) %>%
  setrowtype("Industries") %>% setcoltype("Products")
U + V # row and column names are non-sensical and blindly taken from first argument (U)
## Not run: sum_byname(U, V) # Fails, because row and column types are different
# This also works with lists
sum_byname(list(U,U), list(Y,Y))
sum_byname(list(U,U), list(100,100))
sum_byname(list(U,U), as.list(rep_len(100, 2)))
DF <- data.frame(U = I(list()), Y = I(list()))
DF[[1,"U"]] <- U
DF[[2,"U"]] <- U
DF[[1,"Y"]] <- Y
DF[[2,"Y"]] <- Y
sum_byname(DF$U, DF$Y)
DF %>% mutate(sums = sum_byname(U, Y))
sum_byname(U) # If only one argument, return it.
sum_byname(2, NULL) # Gives 2
sum_byname(2, NA)   # Gives NA
sum_byname(NULL, 1) # Gives 1
sum_byname(list(NULL, 1), list(1, 1))
DF2 <- data.frame(U = I(list()), Y = I(list()))
DF2[[1,"U"]] <- NULL
DF2[[2,"U"]] <- U
DF2[[1,"Y"]] <- Y
DF2[[2,"Y"]] <- Y
sum_byname(DF2$U, DF2$Y)
DF3 <- DF2 %>% mutate(sums = sum_byname(U, Y))
DF3
DF3$sums[[1]]
DF3$sums[[2]]



