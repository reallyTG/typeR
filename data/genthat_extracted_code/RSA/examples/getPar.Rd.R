library(RSA)


### Name: getPar
### Title: Retrieves several variables from an RSA object
### Aliases: getPar

### ** Examples


set.seed(0xBEEF)
n <- 300
err <- 2
x <- rnorm(n, 0, 5)
y <- rnorm(n, 0, 5)
df <- data.frame(x, y)
df <- within(df, {
	diff <- x-y
	absdiff <- abs(x-y)
	SD <- (x-y)^2
	z.sq <- SD + rnorm(n, 0, err)
})

r1 <- RSA(z.sq~x*y, df, models=c("full", "SSQD"))
getPar(r1, "syntax")
getPar(r1, "R2")
getPar(r1, "coef")



