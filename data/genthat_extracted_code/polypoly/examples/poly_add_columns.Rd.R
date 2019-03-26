library(polypoly)


### Name: poly_add_columns
### Title: Add orthogonal polynomial columns to a dataframe
### Aliases: poly_add_columns

### ** Examples

df <- data.frame(time = rep(1:5, 3), y = rnorm(15))

# adds columns "time1", "time2", "time3"
poly_add_columns(df, time, degree = 3)

# adds columns "t1", "t2", "t3 and rescale
poly_add_columns(df, time, degree = 3, prefix = "t", scale_width = 1)



