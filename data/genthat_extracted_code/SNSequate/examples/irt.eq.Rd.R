library(SNSequate)


### Name: irt.eq
### Title: IRT methods for Test Equating
### Aliases: irt.eq irt.eq.default
### Keywords: kernel equating

### ** Examples

data(KB36_t)
dfo <- KB36_t

param_x <- list(a=dfo[,3],b=dfo[,4],c=dfo[,5])
param_y <- list(a=dfo[,7],b=dfo[,8],c=dfo[,9])

theta_points=c(-5.2086,-4.163,-3.1175,-2.072,-1.0269,0.0184,
               1.0635,2.109,3.1546,4.2001)
weights=c(0.000101,0.00276,0.03021,0.142,0.3149,0.3158,
         0.1542,0.03596,0.003925,0.000186)


irt.eq(36, param_x, param_y, method="TS", A=1, B=0)
irt.eq(36, param_x, param_y, theta_points, weights, method="OS",
       A=1, B=0)



