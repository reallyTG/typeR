library(trinROC)


### Name: trinROC.test
### Title: Trinormal based ROC test
### Aliases: trinROC.test

### ** Examples

data(cancer)
data(krebs)

# investigate a single marker:
trinROC.test(dat = cancer[,c(1,3)])
trinROC.test(dat = krebs[,c(1,5)])

# result is equal to:
x1 <- with(cancer, cancer[trueClass=="healthy", 3])
y1 <- with(cancer, cancer[trueClass=="intermediate", 3])
z1 <- with(cancer, cancer[trueClass=="diseased", 3])
trinROC.test(x1, y1, z1)

# comparison of marker 2 and 6:
trinROC.test(dat = cancer[,c(1,3,5)], paired = TRUE)
trinROC.test(dat = cancer[,c(1,3,5)], paired = FALSE)

# result is equal to:
x2 <- with(cancer, cancer[trueClass=="healthy", 5])
y2 <- with(cancer, cancer[trueClass=="intermediate", 5])
z2 <- with(cancer, cancer[trueClass=="diseased", 5])
trinROC.test(x1, y1, z1, x2, y2, z2, paired = TRUE)



