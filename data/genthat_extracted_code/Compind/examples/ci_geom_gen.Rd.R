library(Compind)


### Name: ci_geom_gen
### Title: Generalized geometric mean quantity index numbers
### Aliases: ci_geom_gen

### ** Examples

i1 <- seq(0.3, 1, len = 100) - rnorm (100, 0.1, 0.03)
i2 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.1, 0.03)
i3 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.1, 0.03)
Indic = data.frame(i1, i2,i3)

geom1 = ci_geom_gen(Indic,c(1:3),meth = "EQUAL")
geom1$ci_mean_geom_est
geom1$ci_method


geom2 = ci_geom_gen(Indic,c(1:3),meth = "BOD",0.7,0.3,100)
geom2$ci_geom_bod_est
geom2$ci_geom_bod_weights





