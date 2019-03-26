library(Voss)


### Name: voss1g
### Title: Fractal Brownian function on 1D grid with a generic Voss
###   algorithm
### Aliases: voss1g

### ** Examples

# Example 1: FBF(x) with a s[i]=dchisq(i,df=2)
set.seed(20120522)
plot(voss1g(), type="l", xlab="x", ylab="y",
     main="FBF(x) with a s[i]=dchisq(i,df=2)")
abline(h=0, lty=2)

# Example 2: FBF(x) with a s[i]=dlnorm(i,sdlog=1)
set.seed(20120522)
voss <- voss1g(p=cbind(n=0.5^-seq(0,7)+1, 
                            s=dlnorm(seq(0,7), sdlog=1)))
plot(voss, type="l", xlab="x", ylab="y",
     main="FBF(x) with a s[i]=dlnorm(i,sdlog=1)")
abline(h=0, lty=2)

# Example 3: FBF(x,y) with a s[i]=df(i,df1=7,df2=7)
set.seed(20120522)
voss <- voss1g(p=cbind(n=0.5^-seq(0,7)+1, 
                            s=df(seq(0,7), df1=7, df2=7)))
plot(voss, type="l", xlab="x", ylab="y",
     main="FBF(x) with a s[i]=df(i,df1=7,df2=7)")
abline(h=0, lty=2)



