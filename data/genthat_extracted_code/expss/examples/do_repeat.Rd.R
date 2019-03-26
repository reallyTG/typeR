library(expss)


### Name: do_repeat
### Title: Repeats the same transformations on a specified set of
###   variables/values
### Aliases: do_repeat .do_repeat as_is

### ** Examples

data(iris)
scaled_iris = do_repeat(iris, 
                        i = Sepal.Length %to% Petal.Width, 
                        {
                            i = scale(i)
                        })
head(scaled_iris)

# several stand-in names and standard evaluattion
old_names = qc(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
new_names = paste0("scaled_", old_names)
scaled_iris = do_repeat(iris, 
                        orig = ((old_names)), 
                        scaled = ((new_names)), 
                        {
                            scaled = scale(orig)
                        })
head(scaled_iris)

# numerics
new_df = data.frame(id = 1:20)
# note the automatic creation of the sequence of variables
new_df = do_repeat(new_df, 
                   item = i1 %to% i3, 
                   value = c(1, 2, 3), 
                   {
                       item = value
                   })
head(new_df)

# the same result with internal variable '.item_num'
new_df = data.frame(id = 1:20)
new_df = do_repeat(new_df, 
                   item = i1 %to% i3,
                   {
                       item = .item_num
                   })
head(new_df)

# functions
set.seed(123)
new_df = data.frame(id = 1:20)
new_df = do_repeat(new_df, 
                   item = c(i1, i2, i3), 
                   fun = c("rnorm", "runif", "rexp"), 
                   {
                       item = fun(.N)
                   })
head(new_df)





