library(ineq)


### Name: Pen
### Title: Pen's Parade
### Aliases: Pen
### Keywords: hplot

### ** Examples

# load and attach Philippine income data
data(Ilocos)
attach(Ilocos)
# plot Pen's Parade of income
Pen(income)
Pen(income, fill = hsv(0.1, 0.3, 1))

# income distribution of the USA in 1968 (in 10 classes)
# x vector of class means, n vector of class frequencies
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
n <- c(482, 825, 722, 690, 661, 760, 745, 2140, 1911, 1024)
Pen(x, n = n)
# create artificial grouping variable
myfac <- factor(c(1, 1, 1, 2, 2, 2, 3, 3, 3, 3))
Pen(x, n = n, group = myfac)



