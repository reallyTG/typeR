## ------------------------------------------------------------------------
library(colf)
mymod <- colf_nls(mpg ~ cyl + disp + hp + qsec, mtcars, lower = rep(-2, 5), upper = rep(2, 5))
mymod

## ---- error = TRUE-------------------------------------------------------
colf_nls(mpg ~ cyl + disp + hp + qsec, mtcars, lower = rep(-2, 5), upper = rep(0.5, 5))

## ------------------------------------------------------------------------
colf_nls(mpg ~ cyl + disp + hp + qsec, mtcars, lower = rep(-2, 5), upper = rep(0.5, 5), 
         start = rep(0, 5))

## ------------------------------------------------------------------------
#no intercept
colf_nls(mpg ~ 0 + hp + cyl, mtcars)

colf_nls(mpg ~ ., mtcars)

colf_nls(mpg ~ I(hp + cyl), mtcars)

colf_nls(mpg ~ (hp + cyl + disp)^3, mtcars)

colf_nls(mpg ~ hp:cyl, mtcars)

colf_nls(mpg ~ hp * cyl, mtcars)

## ------------------------------------------------------------------------
set.seed(10)
newdata <- data.frame(hp = mtcars$hp, cyl = mtcars$cyl, disp = mtcars$disp, qsec = mtcars$qsec)
predict(mymod, newdata)

## ---- error = TRUE-------------------------------------------------------
#change column name
newdata2 <- newdata
names(newdata2)[1] <- 'col1'
predict(mymod, newdata2)

#change column class
newdata2 <- newdata
newdata2$cyl <- as.character(newdata2$cyl)  
predict(mymod, newdata2)

## ------------------------------------------------------------------------
summary(mymod)

## ------------------------------------------------------------------------
coef(mymod)
print(mymod)
resid(mymod)
fitted(mymod)

## ------------------------------------------------------------------------
mymod <- colf_nlxb(mpg ~ cyl + disp + hp + qsec, mtcars, lower = rep(-2, 5), upper = rep(2, 5))
mymod

## ---- error = TRUE-------------------------------------------------------
#start values are outside boundaries
colf_nlxb(mpg ~ cyl + disp + hp + qsec, mtcars, lower = rep(-2, 5), upper = rep(0.5, 5))

## ------------------------------------------------------------------------
#so they need to be provided
colf_nlxb(mpg ~ cyl + disp + hp + qsec, mtcars, lower = rep(-5, 5), upper = rep(.5, 5), 
         start = rep(0, 5))

## ------------------------------------------------------------------------
#no intercept
colf_nlxb(mpg ~ 0 + hp + cyl, mtcars)
colf_nlxb(mpg ~ ., mtcars)
colf_nlxb(mpg ~ I(hp + cyl), mtcars)
colf_nlxb(mpg ~ (hp + cyl + disp)^3, mtcars)
colf_nlxb(mpg ~ hp:cyl, mtcars)
colf_nlxb(mpg ~ hp * cyl, mtcars)

## ------------------------------------------------------------------------
set.seed(10)
newdata <- data.frame(hp = mtcars$hp, cyl = mtcars$cyl, disp = mtcars$disp, qsec = mtcars$qsec)
predict(mymod, newdata)

## ---- error = TRUE-------------------------------------------------------
#change column name
newdata2 <- newdata
names(newdata2)[1] <- 'col1'
predict(mymod, newdata2)

#change column class
newdata2 <- newdata
newdata2$cyl <- as.character(newdata2$cyl)  
predict(mymod, newdata2)

## ------------------------------------------------------------------------
summary(mymod)

## ------------------------------------------------------------------------
coef(mymod)
print(mymod)
resid(mymod)
fitted(mymod)

