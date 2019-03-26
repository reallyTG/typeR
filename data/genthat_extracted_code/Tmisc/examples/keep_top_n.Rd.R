library(Tmisc)


### Name: keep_top_n
### Title: Keep rows from top groups of a column
### Aliases: keep_top_n

### ** Examples

# All the cars
(nrow(mtcars))
# Only those in the top 2 groups based on the # carbs
nrow(keep_top_n(mtcars, ~carb, n=2))



