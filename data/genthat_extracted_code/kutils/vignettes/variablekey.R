### R code from vignette source 'variablekey.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: variablekey.Rnw:22-23
###################################################
  if(exists(".orig.enc")) options(encoding = .orig.enc)


###################################################
### code chunk number 2: variablekey.Rnw:143-144
###################################################
if(!dir.exists("plots")) dir.create("plots")


###################################################
### code chunk number 3: Roptions
###################################################
options(device = pdf)
options(width=100, prompt=" ", continue="  ")
options(useFancyQuotes = FALSE) 
options(SweaveHooks=list(fig=function() par(ps=10)))
pdf.options(onefile=F,family="Times",pointsize=10)


###################################################
### code chunk number 4: variablekey.Rnw:328-343
###################################################
set.seed(234234)
N <- 200
mydf <- data.frame(
    x5 = rnorm(N),
    x4 = rpois(N, lambda = 3),
    x3 = ordered(sample(c("lo", "med", "hi"), size = N, replace=TRUE),
            levels = c("med", "lo", "hi")),
    x2 = letters[sample(c(1:4,6), 200, replace = TRUE)],
    x1 = factor(sample(c("cindy", "jan", "marcia"), 200,
            replace = TRUE)),
    x7 = ordered(letters[sample(c(1:4,6), 200, replace = TRUE)]),
    x6 = sample(c(1:5), 200, replace = TRUE),
            stringsAsFactors = FALSE)
mydf$x4[sample(1:N, 10)] <- 999
mydf$x5[sample(1:N, 10)] <- -999


###################################################
### code chunk number 5: variablekey.Rnw:371-372 (eval = FALSE)
###################################################
## key_wide <- keyTemplate(mydf, file = "key_wide.csv", max.levels = 5)


###################################################
### code chunk number 6: variablekey.Rnw:378-379 (eval = FALSE)
###################################################
## key_long <- keyTemplate(mydf, long = TRUE, file = "key_long.csv", max.levels = 5)


###################################################
### code chunk number 7: key0
###################################################
library(kutils)
library(xtable)


###################################################
### code chunk number 8: key10
###################################################
key_wide <- keyTemplate(mydf, max.levels = 5)


###################################################
### code chunk number 9: key30
###################################################
key_long <- keyTemplate(mydf, long = TRUE, max.levels = 5)


###################################################
### code chunk number 10: key20
###################################################
print(xtable(key_wide), include.rownames = FALSE, size = "small", floating = FALSE )


###################################################
### code chunk number 11: key40
###################################################
print(xtable(key_long), include.rownames = FALSE, size = "small", floating = FALSE)


###################################################
### code chunk number 12: variablekey.Rnw:608-609 (eval = FALSE)
###################################################
## mydf.cleaned <- keyApply(mydf, mydf.keylist)


