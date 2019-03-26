# test -- defineMUM()

library(spup)
library(gstat)
library(sp)

# test with data from gstat
data(meuse)
# make spatial
coordinates(meuse) = ~x+y
# make separate spatial grid data frames for mean and sd
m1 <- meuse["zinc"]
m1.sd <- m1
m1.sd[[1]] <- m1.sd[[1]] * rnorm(n = 155, mean = 1, sd = 0.5)
m2 <- meuse["lead"]
m2.sd <- m2
m2.sd[[1]] <- m2.sd[[1]] * rnorm(n = 155, mean = 1, sd = 0.5)
# define srm and UM and sample
crm1 <- makeCRM(acf0 = 0.6, range = 100, model = "Sph")
crm2 <- makeCRM(acf0 = 0.7, range = 100, model = "Exp")
UM1 <- defineUM(uncertain = TRUE, distribution = "norm",
                distr_param = c(m1, m1.sd), crm = crm1)
UM2 <- defineUM(uncertain = TRUE, distribution = "norm",
                distr_param = c(m2, m2.sd), crm = crm2)
cormat <- matrix(c(1,0.7,0.7,1), nrow = 2, ncol = 2)
JointUM <- defineMUM(list(UM1,UM2), cormatrix = cormat)								
class(JointUM)
