library(Voss)


### Name: voss2g
### Title: Fractal Brownian function on 2D grid with a generic Voss
###   algorithm
### Aliases: voss2g

### ** Examples

# Example 1: FBF(x,y) with a s[i]=dchisq(i,df=2)
set.seed(20120522)
voss <- voss2g()
image(voss, xlab="x", ylab="y",
      main="FBF(x,y) with a s[i]=dchisq(i,df=2)")
contour(voss, levels=0, add=TRUE)

# Example 2: FBF(x,y) with a s[i]=dlnorm(i,sdlog=1)
set.seed(20120522)
voss <- voss2g(p=cbind(n=0.5^-seq(0,7)+1, 
                       s=dlnorm(seq(0,7), sdlog=1)))
image(voss, xlab="x", ylab="y",
      main="FBF(x,y) with a s[i]=dlnorm(i,sdlog=1)")
contour(voss, levels=0, add=TRUE)

# Example 3: FBF(x,y) with a s[i]=df(i,df1=7,df2=7)
set.seed(20120522)
voss <- voss2g(p=cbind(n=0.5^-seq(0,7)+1, 
                       s=df(seq(0,7), df1=7, df2=7)))
image(voss, xlab="x", ylab="y",
      main="FBF(x,y) with a s[i]=df(i,df1=5,df2=5)")
contour(voss, levels=0, add=TRUE)



