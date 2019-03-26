library(RandomFields)


### Name: Mathematial C functions
### Title: Transformation of coordinate systems
### Aliases: R.models RFcalc math.c R. R.plus R.minus - R.mult R.div /
###   R.const R.c c R.is R.p R.lon R.lat R.gamma gamma R.acos R.asin asin
###   R.atan atan R.atan2 atan2 R.cos cos R.sin sin R.tan tan R.acosh acosh
###   R.asinh asinh R.atanh atanh R.cosh cosh R.sinh sinh R.tanh tanh R.exp
###   exp R.log log R.expm1 expm1 R.log1p log1p R.exp2 exp2 R.log2 log2
###   R.pow ^ R.sqrt sqrt R.hypot hypot R.cbrt cbrt R.ceil ceiling R.fabs
###   abs R.floor floor R.fmod %% R.round round R.trunc trunc R.erf erf
###   R.erfc erfc R.lgamma lgamma R.nextafter R.nexttoward R.remainder
###   R.ilogb R.fdim R.fmax max R.fmin min %%,ANY,RMmodel-method
###   %%,RMmodel,ANY-method *,RMmodel,character-method
###   *,character,RMmodel-method +,RMmodel,character-method
###   +,RMmodel,factor-method +,RMmodel,list-method
###   +,character,RMmodel-method +,data.frame,RMmodel-method
###   +,factor,RMmodel-method -,RMmodel,character-method
###   -,character,RMmodel-method /,RMmodel,character-method
###   /,character,RMmodel-method ^,ANY,RMmodel-method ^,RMmodel,ANY-method
###   ^,RMmodel,character-method ^,character,RMmodel-method
###   abs,RMmodel-method acosh,RMmodel-method asin,RMmodel-method
###   asinh,RMmodel-method atan2,ANY,RMmodel-method
###   atan2,RMmodel,ANY-method atan,RMmodel-method atanh,RMmodel-method
###   ceiling,RMmodel-method cos,RMmodel-method cosh,RMmodel-method
###   exp,RMmodel-method expm1,RMmodel-method floor,RMmodel-method
###   lgamma,RMmodel-method log1p,RMmodel-method log2,RMmodel-method
###   log,RMmodel-method round,RMmodel,missing-method sin,RMmodel-method
###   sinh,RMmodel-method sqrt,RMmodel-method tan,RMmodel-method
###   tanh,RMmodel-method trunc,RMmodel-method
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again


## simple calculation
RFcalc(3 + R.sin(pi/4))

## calculation performed on a field
RFfctn(R.p(1) + R.p(2), 1:3, 1:3) 
RFfctn(10 + R.p(2), 1:3, 1:3) 

## calculate the distances between two vectors
print(RFfctn(R.p(new="iso"), 1:10, 1:10))

## simulation of a non-stationary field where
## anisotropy by a transform the coordinates (x_1^2, x_2^1.5)
x <- seq(0.1, 6, 0.12)
Aniso <- R.c(R.p(1)^2, R.p(2)^1.5)
z <- RFsimulate(RMexp(Aniso=Aniso), x, x)


## calculating norms can be abbreviated:
x <- seq(-5, 5, 5) #0.1)
z2 <- RFsimulate(RMexp() + -40 + exp(0.5 * R.p(new="isotropic")), x, x)
z1 <- RFsimulate(RMexp() + -40 + exp(0.5 * sqrt(R.p(1)^2 + R.p(2)^2)), x, x)
stopifnot(all.equal(z1, z2))
plot(z1)



## Don't show: 
FinalizeExample()
## End(Don't show)


