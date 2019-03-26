library(ldhmm)


### Name: ldhmm.gamma_init
### Title: Initializing tansition probability paramter
### Aliases: ldhmm.gamma_init
### Keywords: constructor

### ** Examples

  gamma0 <- ldhmm.gamma_init(m=3)
  prob=c(0.9, 0.1, 0.1, 
         0.1, 0.9, 0.0,
         0.1, 0.1, 0.8)
  gamma1 <- ldhmm.gamma_init(m=3, prob=prob)
  gamma2 <- ldhmm.gamma_init(m=2, prob=gamma1, min.gamma=1e-6)




