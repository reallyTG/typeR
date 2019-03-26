library(invctr)


### Name: regressors
### Title: Regress vectors
### Aliases: regressors %/r% %/1% %/2% %/3% %/4% %/n%

### ** Examples


x <- rnorm(100)
y <- x + x^2 + x^3

# Correlate x with y
x%/r%y

# Polynomial regression degree 1 .. 4
x%/1%y
x%/2%y
x%/3%y
x%/4%y

anova(x%/1%y,x%/2%y,x%/3%y,x%/4%y)

# Order n

x%/n%list(y,10)




