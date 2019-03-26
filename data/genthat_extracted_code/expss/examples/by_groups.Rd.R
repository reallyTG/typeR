library(expss)


### Name: by_groups
### Title: Aggregate dataset by grouping variable(s).
### Aliases: by_groups

### ** Examples

# compute mean of the every column for every value of the Species
data(iris)
by_groups(iris, Species, mean)

# compute mean of the every numeric column
iris %>% except(Species) %>% by_groups(mean)

# compute different functions for different columns
# automatic naming
data(mtcars)
by_groups(mtcars, cyl, am, ~ mean(hp), ~ median(mpg))

# with custom names
by_groups(mtcars, cyl, am, mean_hp ~ mean(hp), median_mpg ~ median(mpg))

# variable substitution
group1 = "cyl"
statistic1 = ~ mean(hp)
by_groups(mtcars, (group1), (statistic1))

group2 = "am"
# formulas can be easily constructed from text strings
statistic2 = as.formula("~ median(mpg)") 
by_groups(mtcars, (group2), (statistic2))

by_groups(mtcars, (group1), (group2), (statistic1), (statistic2))




