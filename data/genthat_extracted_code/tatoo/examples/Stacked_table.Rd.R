library(tatoo)


### Name: stack_table
### Title: Stack Tables
### Aliases: stack_table Stacked_table stacked_table stack_table_list

### ** Examples


df1 <- iris[1:5, 3:5]
df2 <- iris[100:105, 3:5]

stack_table(df1, df2)

# ```````````````````````````````````````````
# `      Petal.Length Petal.Width Species
# `   1:          1.4         0.2  setosa
# `   2:          1.4         0.2  setosa
# `   3:          1.3         0.2  setosa
# `   4:          1.5         0.2  setosa
# `   5:          1.4         0.2  setosa
# `   ______________________________________
# `      Petal.Length Petal.Width    Species
# `   1:          4.1         1.3 versicolor
# `   2:          6.0         2.5  virginica
# `   3:          5.1         1.9  virginica
# `   4:          5.9         2.1  virginica
# `   5:          5.6         1.8  virginica
# `   6:          5.8         2.2  virginica
# `
# ```````````````````````````````````````````




