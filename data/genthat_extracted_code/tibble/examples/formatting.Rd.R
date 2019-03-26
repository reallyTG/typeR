library(tibble)


### Name: formatting
### Title: Printing tibbles
### Aliases: formatting print.tbl format.tbl trunc_mat

### ** Examples

print(as_tibble(mtcars))
print(as_tibble(mtcars), n = 1)
print(as_tibble(mtcars), n = 3)

print(as_tibble(iris), n = 100)

print(mtcars, width = 10)

mtcars2 <- as_tibble(cbind(mtcars, mtcars), .name_repair = "unique")
print(mtcars2, n = 25, n_extra = 3)

trunc_mat(mtcars)

if (requireNamespace("nycflights13", quietly = TRUE)) {
  print(nycflights13::flights, n_extra = 2)
  print(nycflights13::flights, width = Inf)
}



