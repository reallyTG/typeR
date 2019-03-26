library(yuima)


### Name: mpv
### Title: Realized Multipower Variation
### Aliases: mpv mpv,yuima-method mpv,yuima.data-method
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
plot(yuima)

mpv(yuima) # true value is 1/3
mpv(yuima,1) # true value is 1/2
mpv(yuima,rep(2/3,3)) # true value is 1/3

# Multi-dimensional case
## Model: dXkt=t*dWk_t (k=1,2,3).

diff.matrix <- diag(3)
diag(diff.matrix) <- c("t","t","t")
model <- setModel(drift=c(0,0,0),diffusion=diff.matrix,time.variable="t",
                  solve.variable=c("x1","x2","x3"))

yuima.samp <- setSampling(Terminal = 1, n = 390) 
yuima <- setYuima(model = model, sampling = yuima.samp) 
yuima <- simulate(yuima)
plot(yuima)

mpv(yuima,list(c(1,1),1,rep(2/3,3))) # true varue is c(1/3,1/2,1/3)




