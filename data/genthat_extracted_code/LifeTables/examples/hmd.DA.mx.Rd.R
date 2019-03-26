library(LifeTables)


### Name: hmd.DA.mx
### Title: Model Life Table Discriminant Analysis
### Aliases: hmd.DA.mx
### Keywords: cluster misc

### ** Examples

# some test data
data(MLTobs)

##48 Belgium 1860-64 (known class = 1)
##180 England 1925-29 (known class = 2)
##207 Estonia 2005-09 (known class = 7)
##266 France 1960-64 (known class = 3)
##410 Japan 2000-04 (known class = 5)
##607 Russia 1980-84 (known class = 6)
##798 USA 2000-04 (known class = 4)

country.nums <- c(48,180,207,266,410,607,798)
test.mx <- t(flt.mx[3:10,country.nums]) # mortality rates for ages 5-40
test.age <- seq(5,40,5)

# classify the test data matrix
examp.out <- hmd.DA.mx(data=test.mx, age=test.age, sex="female")
examp.out$classification

# classify the test data single schedule as matrix
examp.out2 <- hmd.DA.mx(data=t(as.matrix(test.mx[4,])), age=test.age, sex="female")
examp.out2$classification





