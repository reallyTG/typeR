library(rcc)


### Name: nonpar_bs_ci
### Title: Non-Parametric bootstrapped confidence intervals to control RCC
### Aliases: nonpar_bs_ci

### ** Examples

#Generate some data -- 10 parameters, 30 samples
#Most problems will have many more parameters!
set.seed(4e8)
dat <- matrix(rnorm(n=10*30), nrow=10)

#Write a function to do a t-test comparing
#the first 15 samples and the last 15 samples
my.analysis.func <- function(data){
    x <- rep(c(1, 0), each=15)
    B <- t(apply(data, MARGIN=1, FUN=function(y){
        f <- t.test(y~x)
        est <- f$estimate[2]-f$estimate[1]
        stat <- f$statistic
        return(c(est, stat))
    }))
    B <- data.frame(B)
    names(B) <- c("estimate", "statistic")
    return(B)
}

#Calculate confidence intervals
cis <- nonpar_bs_ci(data=dat, analysis.func=my.analysis.func, n.rep=500)
head(cis)



