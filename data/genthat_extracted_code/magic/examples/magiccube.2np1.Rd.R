library(magic)


### Name: magiccube.2np1
### Title: Magic cubes of order 2n+1
### Aliases: magiccube.2np1
### Keywords: array

### ** Examples


#try with m=3, n=2*3+1=7:

m <-7                     
n <- 2*m+1


apply(magiccube.2np1(m),c(1,2),sum)
apply(magiccube.2np1(m),c(1,3),sum)
apply(magiccube.2np1(m),c(2,3),sum)

#major diagonal checks out:
sum(magiccube.2np1(m)[matrix(1:n,n,3)])

#now other diagonals:
b <- c(-1,1)
f <- function(dir,v){if(dir>0){return(v)}else{return(rev(v))}}
g <- function(jj){sum(magiccube.2np1(m)[sapply(jj,f,v=1:n)])}
apply(expand.grid(b,b,b),1,g)  #each diagonal twice, once per direction.



