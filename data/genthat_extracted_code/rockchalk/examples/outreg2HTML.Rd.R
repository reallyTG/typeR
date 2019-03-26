library(rockchalk)


### Name: outreg2HTML
### Title: Convert LaTeX output from outreg to HTML markup
### Aliases: outreg2HTML

### ** Examples

dat <- genCorrelatedData2(means = c(50,50,50,50,50,50),
    sds = c(10,10,10,10,10,10), rho = 0.2, beta = rnorm(7), stde = 50)
m1 <- lm(y ~ x1 + x2 + x3 + x4 + x5 + x6 + x1*x2, data = dat)
summary(m1)

m1out <- outreg(list("Great Regression" = m1), alpha = c(0.05, 0.01, 0.001),
         request = c("fstatistic" = "F"), runFuns = c(AIC = "AIC"),
         float = TRUE)
##html markup will appear on screen
outreg2HTML(m1out)
## outreg2HTML(m1out, filename = "funky.html")
## I'm not running that for you because you
## need to be in the intended working directory

m2 <- lm(y ~ x1 + x2, data = dat)

m2out <- outreg(list("Great Regression" = m1, "Small Regression" = m2),
               alpha = c(0.05, 0.01, 0.01),
                request = c("fstatistic" = "F"), runFuns = c(BIC = "BIC"))
outreg2HTML(m2out)
## Run this for yourself, it will create the output file funky2.html
## outreg2HTML(m2out, filename = "funky2.html")
## Please inspect the file "funky2.html




