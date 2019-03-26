library(OIdata)


### Name: teacher
### Title: Teacher Salaries in St. Louis, Michigan
### Aliases: teacher
### Keywords: teacher salary Michigan degree education datasets

### ** Examples

data(teacher)
boxplot(base ~ degree, teacher)

plot(base ~ years, teacher, pch = 16)
cond1 <- teacher$degree == "MA"
points(teacher$years[cond1], teacher$base[cond1],
       pch = 16, col = "orange")



