library(matsbyname)


### Name: and_byname
### Title: And "by name"
### Aliases: and_byname

### ** Examples

and_byname(TRUE)
and_byname(FALSE)
and_byname(list(TRUE, FALSE), list(TRUE, TRUE), list(TRUE, TRUE), list(TRUE, TRUE))
m1 <- matrix(c(TRUE, TRUE, TRUE, FALSE), nrow = 2, ncol = 2, 
  dimnames = list(c("r1", "r2"), c("c1", "c2")))
m2 <- matrix(c(TRUE, FALSE, TRUE, TRUE), nrow = 2, ncol = 2,
  dimnames = list(c("r1", "r2"), c("c1", "c2")))
and_byname(m1, m1)
and_byname(m1, m2)
and_byname(list(m1, m1), list(m1, m1), list(m2, m2))



