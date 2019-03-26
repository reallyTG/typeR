library(StreamMetabolism)


### Name: simp
### Title: Numeric Integration Using Simpson's method
### Aliases: simp
### Keywords: math

### ** Examples

# 4-x^2-y^2
fun <- function(x, y){
	a <- 4
	b <- x^2
	d <- y^2
	z <- a-b-d
	return(z)
	}
	
a <- fun(seq(-1000,1000,1), seq(-1000,1000,1))
simp(a, x=-1000:1000, n=1000)	



