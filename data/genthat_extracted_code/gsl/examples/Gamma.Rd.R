library(gsl)


### Name: Gamma
### Title: gamma functions
### Aliases: Gamma gamma gsl_sf_gamma lngamma lngamma_sgn gammastar
###   gammainv lngamma_complex taylorcoeff fact doublefact lnfact
###   lndoublefact gsl_sf_choose lnchoose poch lnpoch lnpoch_sgn pochrel
###   gamma_inc_Q gamma_inc_P gamma_inc gsl_sf_beta lnbeta beta_inc
### Keywords: array

### ** Examples

gsl_sf_gamma(3)

lngamma_complex(1+seq(from=0,to=5,by=0.1)*1i)  #table 6.7, p 277 (LH col)
                                               #note 2pi phase diff


jj <- expand.grid(1:10,2:5)
x <- taylorcoeff(jj$Var1,jj$Var2)
dim(x) <- c(10,4)
x    #table 23.5, p818


jj <- expand.grid(36:50,9:13)
x <- gsl_sf_choose(jj$Var1,jj$Var2)
dim(x) <- c(15,5)
x     #table 24.1, p829  (bottom bit)

gamma_inc(1.2,1.3)
beta(1.2, 1.3)
lnbeta(1.2,1.55)
beta_inc(1.2,1.4,1.6)

gamma_inc_P(1.8, 5) - pgamma(5, 1.8)  # should be small




