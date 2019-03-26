library(trinROC)


### Name: rocsurf.emp
### Title: Empirical ROC surface plot
### Aliases: rocsurf.emp

### ** Examples

data(cancer)
x1 <- with(cancer, cancer[trueClass=="healthy", 9])
y1 <- with(cancer, cancer[trueClass=="intermediate", 9])
z1 <- with(cancer, cancer[trueClass=="diseased", 9])

rocsurf.emp(x1, y1, z1)



