library(tatoo)


### Name: multinames<-
### Title: Set the multinames attribute of a Composite_table
### Aliases: multinames<- multinames

### ** Examples


df_mean <- data.frame(
  Species = c("setosa", "versicolor", "virginica"),
  length = c(5.01, 5.94, 6.59),
  width = c(3.43, 2.77, 2.97)
)

multinames(df_mean) = c("species" = 1, measures = 3)

# .species..     ...measures...
# 1    Species     length   width
# 2     setosa       5.01    3.43
# 3 versicolor       5.94    2.77
# 4  virginica       6.59    2.97





