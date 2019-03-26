library(epr)


### Name: pr1
### Title: Analysis of polynomial regression
### Aliases: pr1

### ** Examples

# data
data(data5)

# linear and quadratic models
results1=pr1(data5)
results1

# analysis in completely randomized design
data(data1)
r1=pr2(data1)
names(r1)
r1
r1[1]

pr1(data1)

# analysis in randomized block design
data(data2)
r2=pr2(data2, design=2)
r2

pr1(data2, mixed=TRUE)





