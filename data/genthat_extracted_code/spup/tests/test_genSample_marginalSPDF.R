# test -- genSample()
options(digits = 6)

library(spup)
library(gstat)
library(sp)

# test with data from gstat
data(meuse)
set.seed(12345)
# make spatial
coordinates(meuse) = ~x+y
# make separate spatial grid data frames for mean and sd
m <- meuse["zinc"]
m.sd <- m
m.sd[[1]] <- m.sd[[1]] * rnorm(n = 155, mean = 1, sd = 0.5)
# define srm and UM and sample
crm <- makeCRM(acf0 = 0.6, range = 40, model = "Sph")
UM <- defineUM(uncertain = TRUE, distribution = "norm",
               distr_param = c(m, m.sd), crm = crm)
a <- genSample(UM, 10, samplemethod = "ugs")
b <- genSample(UM, 10, samplemethod = "ugs", asList = FALSE)
str(a)
str(b)
