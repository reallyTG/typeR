library(tatoo)


### Name: mash_table
### Title: Mash Tables
### Aliases: mash_table Mashed_table mashed_table mash_table_list

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


# Mash by row

mash_table(df_mean, df_sd)

#       Species length width
# 1:     setosa   5.01  3.43
# 2:     setosa   0.35  0.38
# 3: versicolor   5.94  2.77
# 4: versicolor   0.52  0.31
# 5:  virginica   6.59  2.97
# 6:  virginica   0.64  0.32


# Mash by column

mash_table(
  df_mean, df_sd,
  mash_method = 'col',
  id_vars = 'Species'
)

#       Species    Species length length width width
# 1:     setosa     setosa   5.01   0.35  3.43  0.38
# 2: versicolor versicolor   5.94   0.52  2.77  0.31
# 3:  virginica  virginica   6.59   0.64  2.97  0.32


# Use the id_vars argument to prevent undesired dpulicated columns,
# and name the input data.frames to get multi-col headings.

mash_table(
  mean = df_mean, sd = df_sd,
  mash_method = 'col',
  id_vars = 'Species'
)

#    ..........     ..length...     ...width...
# 1    Species     mean     sd     mean     sd
# 2     setosa     5.01   0.35     3.43   0.38
# 3 versicolor     5.94   0.52     2.77   0.31
# 4  virginica     6.59   0.64     2.97   0.32




