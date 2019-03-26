library(tatoo)


### Name: comp_table
### Title: Compose Tables
### Aliases: comp_table composite_table Composite_table comp_table_list

### ** Examples


df_mean <- data.frame(
  Species = c("setosa", "versicolor", "virginica"),
  length = c(5.01, 5.94, 6.59),
  width = c(3.43, 2.77, 2.97)
)

df_sd <- data.frame(
  Species = c("setosa", "versicolor", "virginica"),
  length = c(0.35, 0.52, 0.64),
  width = c(0.38, 0.31, 0.32)
)

comp_table(mean = df_mean, sd = df_sd)

# ...........mean............     ............sd.............
# 1    Species   length   width        Species   length   width
# 2     setosa     5.01    3.43         setosa     0.35    0.38
# 3 versicolor     5.94    2.77     versicolor     0.52    0.31
# 4  virginica     6.59    2.97      virginica     0.64    0.32


comp_table(mean = df_mean, sd = df_sd, id_vars = 'Species')

# ..........     .....mean.....     ......sd......
# 1    Species     length   width     length   width
# 2     setosa       5.01    3.43       0.35    0.38
# 3 versicolor       5.94    2.77       0.52    0.31
# 4  virginica       6.59    2.97       0.64    0.32




