library(listarrays)


### Name: split_on_dim
### Title: Split an array along a dimension
### Aliases: split_on_dim split_on_rows split_on_cols split_along_dim
###   split_along_rows split_along_cols

### ** Examples

X <- array(1:8, c(2,3,4))
X
split_along_dim(X, 2)

# specify f as a factor, akin to base::split()
split_on_dim(X, 2, c("a", "a", "b"), drop = FALSE)

d <- c(10, 3, 3)
X <- array(1:prod(d), d)
y <- letters[1:10]
Y <- onehot(y)

# specify `f`` as relative partition sizes
if(require(zeallot) && require(magrittr) && require(purrr)) {

c(train, validate, test) %<-% {
  list(X = X, Y = Y, y = y) %>%
    shuffle_rows() %>%
    split_on_rows(c(0.6, 0.2, 0.2)) %>%
    transpose()
}

str(test)
str(train)
str(validate)

}


# with with array data in a data frame by splitting row-wise
if(require(tibble))
  tibble(y, X = split_along_rows(X))



