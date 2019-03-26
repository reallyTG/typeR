library(yuima)


### Name: bns.test
### Title: Barndorff-Nielsen and Shephard's Test for the Presence of Jumps
###   Using Bipower Variation
### Aliases: bns.test bns.test,yuima-method bns.test,yuima.data-method
###   bns.test,list-method
### Keywords: ts

### ** Examples


set.seed(123)

# One-dimensional case
## Model: dXt=t*dWt+t*dzt, 
## where zt is a compound Poisson process with intensity 5 and jump sizes distribution N(0,0.1).

model <- setModel(drift=0,diffusion="t",jump.coeff="t",measure.type="CP",
                  measure=list(intensity=5,df=list("dnorm(z,0,sqrt(0.1))")),
                  time.variable="t")

yuima.samp <- setSampling(Terminal = 1, n = 390) 
yuima <- setYuima(model = model, sampling = yuima.samp) 
yuima <- simulate(yuima)
plot(yuima) # The path seems to involve some jumps

bns.test(yuima) # standard type

bns.test(yuima,type="log") # log type

bns.test(yuima,type="ratio") # ratio type

# Multi-dimensional case
## Model: dXkt=t*dWk_t (k=1,2,3) (no jump case).

diff.matrix <- diag(3)
diag(diff.matrix) <- c("t","t","t")
model <- setModel(drift=c(0,0,0),diffusion=diff.matrix,time.variable="t",
                  solve.variable=c("x1","x2","x3"))

yuima.samp <- setSampling(Terminal = 1, n = 390) 
yuima <- setYuima(model = model, sampling = yuima.samp) 
yuima <- simulate(yuima)
plot(yuima)

bns.test(yuima)




