library(TeachingDemos)


### Name: outliers
### Title: Outliers data
### Aliases: outliers
### Keywords: datasets

### ** Examples

data(outliers)
qqnorm(outliers)
qqline(outliers)
hist(outliers)

o.chuck <- function(x) {  # function to throw away outliers
	qq <- quantile(x, c(1,3)/4, names=FALSE)
	r <- diff(qq) * 1.5
	tst <- x < qq[1] - r | x > qq[2] + r
	if(any(tst)) {
		cat('Removing ', paste(x[tst], collapse=', '), '\n')
		x <- x[!tst]
		out <- Recall(x)
	} else {
		out <- x
	}
	out
}

x <- o.chuck( outliers )
length(x)

if(require(MASS)) {
  char2seed('robust')
  x <- 1:100
  y <- 3 + 2*x + sample(scale(outliers))*10

  plot(x,y)
  fit <- lm(y~x)
  abline(fit, col='red')

  fit.r <- rlm(y~x)
  abline(fit.r, col='blue', lty='dashed')

  rbind(coef(fit), coef(fit.r))
  length(o.chuck(resid(fit)))
}



### The data was generated using code similar to:

char2seed('outlier')

outliers <- rnorm(25)

dir <- 1

while( length(outliers) < 100 ){
	qq <- quantile(c(outliers, dir*Inf), c(1,3)/4)
	outliers <- c(outliers,
		qq[ 1.5 + dir/2 ] + dir*1.55*diff(qq) + dir*abs(rnorm(1)) )
	dir <- -dir
}




