library(BART)


### Name: mbart
### Title: BART for multinomial outcomes with Normal latents
### Aliases: mbart mc.mbart
### Keywords: nonparametric tree regression nonlinear

### ** Examples


N=500
set.seed(12)
x1=runif(N)
x2=runif(N, max=1-x1)
x3=1-x1-x2
x.train=cbind(x1, x2, x3)
y.train=0
for(i in 1:N)
    y.train[i]=sum((1:3)*rmultinom(1, 1, x.train[i, ]))
table(y.train)/N

##test mbart with token run to ensure installation works
set.seed(99)
post = mbart(x.train, y.train, nskip=1, ndpost=1)

## Not run: 
##D set.seed(99)
##D post=mbart(x.train, y.train, x.train)
##D ##mc.post=mbart(x.train, y.train, x.test, mc.cores=8, seed=99)
##D 
##D K=3
##D i=seq(1, N*K, K)-1
##D for(j in 1:K)
##D     print(cor(x.train[ , j], post$prob.test.mean[i+j])^2)
##D 
## End(Not run)



