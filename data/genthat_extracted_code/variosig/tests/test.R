library(variosig)
library(gstat)
library(sp)
library(geoR)
library(testthat)

data(meuse)
coordinates(meuse) = ~x+y
vario0 <- variogram(zinc~1, data = meuse)
perm <- envelope(vario0, data = meuse, formula = zinc~1, nsim = 9, cutoff = 1500)
expect_that(perm, is_a("list"))
expect_that(envsig(perm, method = "eb"), is_a("list"))
expect_that(envplot(perm), is_a("character"))

vario1 <- variogram(log(zinc)~1, data = meuse)
perm <- envelope(vario1, data = meuse, formula = log(zinc)~1, nsim = 9)
expect_that(perm, is_a("list"))
expect_that(envsig(perm, index = 2, method = "eb"), is_a("list"))
expect_that(envplot(perm), is_a("character"))

meuse <- as.geodata(obj = meuse, data.col = 4, covar.col = 1:3,
                    covar.names = c("cadmium", "copper","lead"))
meuse$data <- log(meuse$data)
vario2 <- variog(meuse,max.dist=1500)
perm2 <- envelope(vario2, meuse, nsim=9, cluster = TRUE, n.cluster = 10, max.dist=1500)
expect_that(perm2, is_a("list"))
expect_that(envsig(perm2, method = "eb"), is_a("list"))
expect_that(envplot(perm2), is_a("character"))


