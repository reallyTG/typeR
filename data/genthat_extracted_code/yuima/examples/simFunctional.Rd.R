library(yuima)


### Name: simFunctional
### Title: Calculate the value of functional
### Aliases: simFunctional simFunctional,yuima-method Fnorm
###   Fnorm,yuima-method F0 F0,yuima-method
### Keywords: ts

### ** Examples

set.seed(123)
# to the Black-Scholes economy:
# dXt^e = Xt^e * dt + e * Xt^e * dWt
diff.matrix <- matrix( c("x*e"), 1,1)
model <- setModel(drift = c("x"), diffusion = diff.matrix)
# call option is evaluated by averating
# max{ (1/T)*int_0^T Xt^e dt, 0}, the first argument is the functional of interest:
Terminal <- 1
xinit <- c(1)
f <- list( c(expression(x/Terminal)), c(expression(0)))
F <- 0
division <- 1000
e <- .3
samp <- setSampling(Terminal = Terminal, n = division)
yuima <- setYuima(model = model,sampling = samp) 
yuima <- setFunctional( yuima, xinit=xinit, f=f,F=F,e=e)
# evaluate the functional value

yuima <- simulate(yuima,xinit=xinit,true.par=e)
Fe <- simFunctional(yuima)
Fe
Fenorm <- Fnorm(yuima)
Fenorm



