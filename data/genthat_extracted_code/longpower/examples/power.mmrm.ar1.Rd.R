library(longpower)


### Name: power.mmrm.ar1
### Title: Linear mixed model sample size calculations.
### Aliases: power.mmrm.ar1
### Keywords: effects mixed power random sample size

### ** Examples


# reproduce Table 2 from Lu, Luo, & Chen (2008)
tab <- c()
for(J in c(2,4))
for(aJ in (1:4)/10)
for(p1J in c(0, c(1, 3, 5, 7, 9)/10)){
  rJ <- 1-aJ
  r <- seq(1, rJ, length = J)
  # p1J = p^(J-1)
  tab <- c(tab, power.mmrm.ar1(rho = p1J^(1/(J-1)), ra = r, sigmaa = 1, 
    lambda = 1, times = 1:J,
    delta = 1, sig.level = 0.05, power = 0.80)$phi1)
}
matrix(tab, ncol = 6, byrow = TRUE)

# approximate simulation results from Table 5 from Lu, Luo, & Chen (2008)
ra <- c(100, 76, 63, 52)/100
rb <- c(100, 87, 81, 78)/100

power.mmrm.ar1(rho=0.6, ra=ra, sigmaa=1, rb = rb, 
               lambda = sqrt(1.25/1.75), power = 0.904, delta = 0.9)
power.mmrm.ar1(rho=0.6, ra=ra, sigmaa=1, rb = rb, 
               lambda = 1.25/1.75, power = 0.910, delta = 0.9)
power.mmrm.ar1(rho=0.6, ra=ra, sigmaa=1, rb = rb, 
               lambda = 1, power = 0.903, delta = 0.9)
power.mmrm.ar1(rho=0.6, ra=ra, sigmaa=1, rb = rb,
               lambda = 2, power = 0.904, delta = 0.9)

power.mmrm.ar1(N=81, ra=ra, sigmaa=1, rb = rb, 
               lambda = sqrt(1.25/1.75), power = 0.904, delta = 0.9)
power.mmrm.ar1(N=87, rho=0.6, ra=ra, sigmaa=1, rb = rb,
               lambda = 1.25/1.75, power = 0.910)
power.mmrm.ar1(N=80, rho=0.6, ra=ra, sigmaa=1, rb = rb, 
               lambda = 1, delta = 0.9)
power.mmrm.ar1(N=84, rho=0.6, ra=ra, sigmaa=1, rb = rb,
               lambda = 2, power = 0.904, delta = 0.9, sig.level = NULL)

# Extracting paramaters from gls objects with AR1 correlation

# Create time index:
Orthodont$t.index <- as.numeric(factor(Orthodont$age, levels = c(8, 10, 12, 14)))
with(Orthodont, table(t.index, age))

fmOrth.corAR1 <- gls( distance ~ Sex * I(age - 11), 
  Orthodont,
  correlation = corAR1(form = ~ t.index | Subject),
  weights = varIdent(form = ~ 1 | age) )
summary(fmOrth.corAR1)$tTable

C <- corMatrix(fmOrth.corAR1$modelStruct$corStruct)[[1]]
sigmaa <- fmOrth.corAR1$sigma *
          coef(fmOrth.corAR1$modelStruct$varStruct, unconstrained = FALSE)['14']
ra <- seq(1,0.80,length=nrow(C))
power.mmrm(N=100, Ra = C, ra = ra, sigmaa = sigmaa, power = 0.80)
power.mmrm.ar1(N=100, rho = C[1,2], ra = ra, sigmaa = sigmaa, power = 0.80)




