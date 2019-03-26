library(agsemisc)


### Name: statshelpers
### Title: Simple stats and tabulation helper functions
### Aliases: a.findcorrelations a.iqr a.qr a.proportion.test
###   a.printextremes
### Keywords: quantile quartile correlation rank summary

### ** Examples

set.seed(17)
base = rnorm(100)
a = floor(base*10)
b = floor(a+runif(100, -10, 11))
c=floor(base)
d=ordered(floor(b/8))  # allows for rank correlation only
df=data.frame(a=a,b=b,c=c,d=d)

a.findcorrelations(df,min.cor=0.85)

a.printextremes(iris, vars=c("Species", "Sepal.Length", "Petal.Width"), 
                largest=c(3, -4, -5), showalso=c("Petal.Length"))




