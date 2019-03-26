library(trinROC)


### Name: emp.vus
### Title: Empirical VUS calculation
### Aliases: emp.vus

### ** Examples

data(krebs)
x1 <- with(krebs, cancer[trueClass=="healthy", 4])
y1 <- with(krebs, cancer[trueClass=="intermediate", 4])
z1 <- with(krebs, cancer[trueClass=="diseased", 4])

emp.vus(x1, y1, z1)
# Alternatively:
emp.vus(dat = krebs[,c(1,4)])



