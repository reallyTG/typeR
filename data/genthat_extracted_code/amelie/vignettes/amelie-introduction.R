## ------------------------------------------------------------------------
library(amelie)
x1 <- c(1,.2,3,1,1,.7,-2,-1)
x2 <- c(0,.5,0,.4,0,1,-.3,-.1)
x <- do.call(cbind,list(x1,x2))
y <- c(0,0,0,0,0,0,1,1)
dframe <- data.frame(x,y)

df_fit <- ad(y ~ x1 + x2, dframe)

mat_fit <- ad(x = x, y = y)


