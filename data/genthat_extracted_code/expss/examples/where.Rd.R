library(expss)


### Name: where
### Title: Subset (filter) data.frames/matrices/vectors/lists
### Aliases: where .where

### ** Examples

# leave only 'setosa'
where(iris, Species == "setosa")
# leave only first five rows
where(iris, 1:5)


# example of .N usage. 
set.seed(42)
train = where(iris, sample(.N, 100))
str(train)

set.seed(42)
test = where(iris, -sample(.N, 100))
str(test)

# list example
set.seed(123)
rand_matr = matrix(sample(10, 60, replace = TRUE), ncol = 3)
rand_vec = sample(10, 20, replace = TRUE)
my_list = list(iris, rand_matr, rand_vec)
# two random elements from the each list item
where(my_list, sample(.N, 2))



