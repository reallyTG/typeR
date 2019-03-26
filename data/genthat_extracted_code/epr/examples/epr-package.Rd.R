library(epr)


### Name: epr-package
### Title: Easy Polynomial Regression
### Aliases: epr-package epr

### ** Examples

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


# analysis in latin square design
data(data3)
r3=pr2(data3, design=3)
r3

# analysis in several latin squares
data(data4)
r4=pr2(data4, design=4)
r4






