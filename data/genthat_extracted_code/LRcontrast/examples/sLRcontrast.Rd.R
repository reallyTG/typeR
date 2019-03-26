library(LRcontrast)


### Name: sLRcontrast
### Title: Calculate LR test statistics
### Aliases: sLRcontrast
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Simulate the power of the LR contrast test

# five dose levels will be used
doselvl <- c(0, 0.05, 0.2, 0.6, 1)
dose <- c(rep(0, 10), rep(0.05, 10), rep(0.2, 10), rep(0.6, 10), rep(1, 10))

# each row of 'resp' will contain one sample of size 50
resp <- matrix(nrow=100, ncol=50)

# the linear model will serve as the data generating model
linear <- function(dose, e0, delta){e0 + delta * dose} 

# now 'resp' is generated:
for (i in 1:100)
     {for(j in 1:5)
        {resp[i,(j*10-9):(10*j)]<-rnorm(10, mean=linear(doselvl[j], 0.2, 0.6), sd=1.478)}}  

# the simulated 95% quantile in this case:
quantile <- 4.349362

# now the power is simulated
count <- 0
for (i in 1:100)
     {if(sLRcontrast(dose = dose, resp = resp[i,], models = c("linear", "emax", 
                     "exponential", "linlog"))[5] > quantile)
         {count <- count + 1}}

#power:
count/100



