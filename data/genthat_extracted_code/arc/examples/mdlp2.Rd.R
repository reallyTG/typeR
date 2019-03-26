library(arc)


### Name: mdlp2
### Title: Supervised Discretization
### Aliases: mdlp2

### ** Examples

  mdlp2(datasets::iris) #gives the same result as mdlp(datasets::iris) from discretize package
  #uses Sepal.Length as target variable
  mdlp2(df=datasets::iris, cl_index = 1,handle_missing = TRUE, labels = TRUE,
  skip_nonnumeric = TRUE, infinite_bounds = TRUE, min_distinct_values = 30)




