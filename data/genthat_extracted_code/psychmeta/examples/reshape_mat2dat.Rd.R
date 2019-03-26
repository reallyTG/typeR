library(psychmeta)


### Name: reshape_mat2dat
### Title: Extract a long-format correlation database from a correlation
###   matrix and its supporting vectors/matrices of variable information
### Aliases: reshape_mat2dat

### ** Examples

## Create a hypothetical matrix of data from a small study:
mat <- data.frame(var_names = c("X", "Y", "Z"),
                  n = c(100, 100, 100),
                  mean = c(4, 5, 3),
                  sd = c(2.4, 2.6, 2),
                  rel = c(.8, .7, .85),
                  reshape_vec2mat(cov = c(.3, .4, .5)))

## Arguments can be provided as quoted characters or as the unquoted names of data's columns:
reshape_mat2dat(var_names = var_names,
               cor_data = c("Var1", "Var2", "Var3"),
               common_data = "n",
               unique_data = c("mean", "sd", "rel"),
               data = mat)

## Arguments can also provided as raw vectors, matrices, dataframes, etc. without a data argument:
reshape_mat2dat(var_names = mat[,1],
               cor_data = mat[,6:8],
               common_data = mat[,2],
               unique_data = mat[,3:5])

## If data is not null, arguments can be a mix of matrix/dataframe/vector and column-name arguments
reshape_mat2dat(var_names = mat[,1],
               cor_data = mat[,6:8],
               common_data = "n",
               unique_data = c("mean", "sd", "rel"),
               data = mat)



