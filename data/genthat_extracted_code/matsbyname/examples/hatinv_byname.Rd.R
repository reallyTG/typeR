library(matsbyname)


### Name: hatinv_byname
### Title: Hatize and invert a vector
### Aliases: hatinv_byname

### ** Examples

v <- matrix(1:10, ncol = 1, dimnames = list(c(paste0("i", 1:10)), c("c1"))) %>%
  setrowtype("Industries") %>% setcoltype(NA)
r <- matrix(1:5, nrow = 1, dimnames = list(c("r1"), c(paste0("c", 1:5)))) %>%
  setrowtype(NA) %>% setcoltype("Commodities")
hatinv_byname(v)
hatinv_byname(r)
# This function also works with lists.
hatinv_byname(list(v, v))
# Watch out for 0 values
v2 <- matrix(0:1, ncol = 1, dimnames = list(c(paste0("i", 0:1)), c("p1"))) %>%
  setrowtype("Industries") %>% setcoltype(NA)
# Produces singular matrix error
## Not run: v2 %>% hatize_byname() %>% invert_byname
# Handles 0 values well
hatinv_byname(v2)
hatinv_byname(v2, inf_becomes = 42)
hatinv_byname(v2, inf_becomes = NULL)



