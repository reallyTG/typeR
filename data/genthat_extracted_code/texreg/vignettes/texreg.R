### R code from vignette source 'texreg.Rnw'

###################################################
### code chunk number 1: texreg.Rnw:796-797
###################################################
options(prompt="R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: texreg.Rnw:804-810
###################################################
ctl <- c(4.17, 5.58, 5.18, 6.11, 4.50, 4.61, 5.17, 4.53, 5.33, 5.14)
trt <- c(4.81, 4.17, 4.41, 3.59, 5.87, 3.83, 6.03, 4.89, 4.32, 4.69)
group <- gl(2, 10, 20, labels = c("Ctl", "Trt"))
weight <- c(ctl, trt)
m1 <- lm(weight ~ group)
m2 <- lm(weight ~ group - 1)


###################################################
### code chunk number 3: texreg.Rnw:814-815
###################################################
summary(m2)


###################################################
### code chunk number 4: texreg.Rnw:820-822 (eval = FALSE)
###################################################
## library("texreg")
## screenreg(list(m1, m2))


###################################################
### code chunk number 5: texreg.Rnw:826-828
###################################################
library("texreg")
screenreg(list(m1, m2))


###################################################
### code chunk number 6: texreg.Rnw:845-848
###################################################
texreg(list(m1, m2), dcolumn = TRUE, booktabs = TRUE,
    use.packages = FALSE, label = "tab:3", caption = "Two linear models.",
    float.pos = "hb!")


###################################################
### code chunk number 7: texreg.Rnw:879-884
###################################################
mytable <- texreg(list(m1, m2), label = "tab:4", 
    caption = "Bolded coefficients, custom notes, three digits.", 
    float.pos = "h", bold = 0.05, stars = 0,  custom.note = 
    "Coefficients with $p < 0.05$ in \\textbf{bold}.", 
    digits = 3, leading.zero = FALSE, omit.coef = "Inter")


###################################################
### code chunk number 8: texreg.Rnw:886-891
###################################################
texreg(list(m1, m2), label = "tab:4", 
    caption = "Bolded coefficients, custom notes, three digits.", 
    float.pos = "h", bold = 0.05, stars = 0,  custom.note = 
    "Coefficients with $p < 0.05$ in \\textbf{bold}.", 
    digits = 3, leading.zero = FALSE, omit.coef = "Inter")


###################################################
### code chunk number 9: texreg.Rnw:926-950
###################################################
library("nlme")
m3 <- gls(follicles ~ sin(2 * pi * Time) + cos(2 * pi * Time), Ovary,
    correlation = corAR1(form = ~ 1 | Mare))

texreg(
    list(m1, m3),
    custom.coef.names = c(
        "Intercept", 
        "Control", 
        "$\\sin(2 \\cdot \\pi \\cdot \\mbox{time})$", 
        "$\\cos(2 \\cdot \\pi \\cdot \\mbox{time})$"
    ), 
    custom.model.names = c("OLS model", "GLS model"), 
    reorder.coef = c(1, 3, 4, 2),
    caption = "Multiple model types, custom names, and single row.", 
    label = "tab:5", 
    stars = c(0.01, 0.001), 
    dcolumn = TRUE, 
    booktabs = TRUE, 
    use.packages = FALSE,
    single.row = TRUE,
    include.adjrs = FALSE,
    include.bic = FALSE
)


###################################################
### code chunk number 10: texreg.Rnw:1003-1010 (eval = FALSE)
###################################################
## library("sandwich")
## library("lmtest")
## hc <- vcovHC(m2)
## ct <- coeftest(m2, vcov = hc)
## se <- ct[, 2]
## pval <- ct[, 4]
## texreg(m2, override.se = se, override.pvalues = pval)


###################################################
### code chunk number 11: texreg.Rnw:1031-1033
###################################################
htmlreg(list(m1, m2, m3), file = "mytable.doc", inline.css = FALSE, 
    doctype = TRUE, html.tag = TRUE, head.tag = TRUE, body.tag = TRUE)


###################################################
### code chunk number 12: texreg.Rnw:1055-1057
###################################################
htmlreg(list(m1, m2, m3), star.symbol = "\\*", center = TRUE, 
    doctype = FALSE)


###################################################
### code chunk number 13: texreg.Rnw:1083-1087
###################################################
texreg(list(m1, m1, m2), ci.force = c(FALSE, TRUE, TRUE), ci.test = 0,
    ci.force.level = 0.95, bold = 0.05, float.pos = "tb",
    caption = "Enforcing confidence intervals.",
    booktabs = TRUE, use.packages = FALSE, single.row = TRUE)


###################################################
### code chunk number 14: figure
###################################################
plotreg(m1, custom.coef.names = c("Intercept", "Group Trt"))


###################################################
### code chunk number 15: texreg.Rnw:1159-1183 (eval = FALSE)
###################################################
## extract.lm <- function(model) {
##   s <- summary(model)
##   names <- rownames(s$coef)
##   co <- s$coef[, 1]
##   se <- s$coef[, 2]
##   pval <- s$coef[, 4]
##   
##   rs <- s$r.squared
##   adj <- s$adj.r.squared
##   n <- nobs(model)
##   
##   gof <- c(rs, adj, n)
##   gof.names <- c("R$^2$", "Adj.\\ R$^2$", "Num.\\ obs.")
##   
##   tr <- createTexreg(
##       coef.names = names, 
##       coef = co, 
##       se = se, 
##       pvalues = pval, 
##       gof.names = gof.names, 
##       gof = gof
##   )
##   return(tr)
## }


###################################################
### code chunk number 16: texreg.Rnw:1207-1209 (eval = FALSE)
###################################################
## setMethod("extract", signature = className("lm", "stats"), 
##     definition = extract.lm)


###################################################
### code chunk number 17: texreg.Rnw:1216-1218 (eval = FALSE)
###################################################
## setMethod("extract", signature = className("clogit", "survival"), 
##     definition = extract.clogit)


###################################################
### code chunk number 18: texreg.Rnw:1227-1272 (eval = FALSE)
###################################################
## extract.lm <- function(model, include.rsquared = TRUE, 
##     include.adjrs = TRUE, include.nobs = TRUE, ...) {
##   
##   s <- summary(model, ...)
##   names <- rownames(s$coef)
##   co <- s$coef[, 1]
##   se <- s$coef[, 2]
##   pval <- s$coef[, 4]
##   
##   gof <- numeric()
##   gof.names <- character()
##   gof.decimal <- logical()
##   if (include.rsquared == TRUE) {
##     rs <- s$r.squared
##     gof <- c(gof, rs)
##     gof.names <- c(gof.names, "R$^2$")
##     gof.decimal <- c(gof.decimal, TRUE)
##   }
##   if (include.adjrs == TRUE) {
##     adj <- s$adj.r.squared
##     gof <- c(gof, adj)
##     gof.names <- c(gof.names, "Adj.\\ R$^2$")
##     gof.decimal <- c(gof.decimal, TRUE)
##   }
##   if (include.nobs == TRUE) {
##     n <- nobs(model)
##     gof <- c(gof, n)
##     gof.names <- c(gof.names, "Num.\\ obs.")
##     gof.decimal <- c(gof.decimal, FALSE)
##   }
##   
##   tr <- createTexreg(
##       coef.names = names, 
##       coef = co, 
##       se = se, 
##       pvalues = pval, 
##       gof.names = gof.names, 
##       gof = gof, 
##       gof.decimal = gof.decimal
##   )
##   return(tr)
## }
## 
## setMethod("extract", signature = className("lm", "stats"), 
##     definition = extract.lm)


###################################################
### code chunk number 19: texreg.Rnw:1296-1297 (eval = FALSE)
###################################################
## install.packages("texreg")


###################################################
### code chunk number 20: texreg.Rnw:1300-1301 (eval = FALSE)
###################################################
## install.packages("texreg", repos = "http://R-Forge.R-project.org")


###################################################
### code chunk number 21: texreg.Rnw:1304-1305 (eval = FALSE)
###################################################
## update.packages("texreg", repos = "http://R-Forge.R-project.org")


###################################################
### code chunk number 22: texreg.Rnw:1315-1316 (eval = FALSE)
###################################################
## help(package = "texreg")


###################################################
### code chunk number 23: texreg.Rnw:1319-1320 (eval = FALSE)
###################################################
## help("texreg")


###################################################
### code chunk number 24: texreg.Rnw:1323-1325 (eval = FALSE)
###################################################
## help("extract")
## help("extract-methods")


