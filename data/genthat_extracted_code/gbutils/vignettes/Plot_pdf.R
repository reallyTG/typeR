### R code from vignette source 'Plot_pdf.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: Plot_pdf.Rnw:61-62
###################################################
library(gbutils)


###################################################
### code chunk number 2: Plot_pdf.Rnw:77-80
###################################################
pdf1 <- function(x) dnorm(x, mean = 100, sd = 5) # pdf
qdf1 <- function(x) qnorm(x, mean = 100, sd = 5) # qf
cdf1 <- function(x) pnorm(x, mean = 100, sd = 5) # cdf


###################################################
### code chunk number 3: Plot_pdf.Rnw:85-86
###################################################
plotpdf(pdf1, qdf1)


###################################################
### code chunk number 4: Plot_pdf.Rnw:91-92
###################################################
plotpdf(pdf1, cdf = cdf1)


###################################################
### code chunk number 5: Plot_pdf.Rnw:97-98
###################################################
plotpdf(pdf1, cdf = cdf1, lq = 0.001, uq = 0.999)


###################################################
### code chunk number 6: Plot_pdf.Rnw:101-102
###################################################
plotpdf(cdf1, cdf = cdf1, lq = 0.001, uq = 0.999) # plot a cdf


###################################################
### code chunk number 7: Plot_pdf.Rnw:106-112
###################################################
pf1 <- function(x){
    0.25 * pnorm(x, mean = 3, sd = 0.2) + 0.75 * pnorm(x, mean = -1, sd = 0.5)
}
df1 <- function(x){
    0.25 * dnorm(x, mean = 3, sd = 0.2) + 0.75 * dnorm(x, mean = -1, sd = 0.5)
}


###################################################
### code chunk number 8: Plot_pdf.Rnw:116-117
###################################################
plotpdf(df1, cdf = pf1) # plot the pdf


###################################################
### code chunk number 9: Plot_pdf.Rnw:121-122
###################################################
plotpdf(pf1, cdf = pf1) # plot the cdf


###################################################
### code chunk number 10: Plot_pdf.Rnw:127-129
###################################################
plotpdf(pf1, cdf = pf1)                           # plot the cdf
plotpdf(df1, cdf = pf1, add = TRUE, col = "blue") # overlay the pdf


###################################################
### code chunk number 11: Plot_pdf.Rnw:136-137
###################################################
c(q5pc = cdf2quantile(0.05, pf1), q95pc = cdf2quantile(0.95, pf1))


