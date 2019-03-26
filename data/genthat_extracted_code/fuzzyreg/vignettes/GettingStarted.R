### R code from vignette source 'GettingStarted.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: GettingStarted.Rnw:34-37 (eval = FALSE)
###################################################
## install.packages("fuzzyreg", dependencies = TRUE)
## require(fuzzyreg)
## help(package = "fuzzyreg")


###################################################
### code chunk number 2: GettingStarted.Rnw:38-39
###################################################
if(!require(fuzzyreg)) install.packages("fuzzyreg", dependencies = TRUE)


###################################################
### code chunk number 3: fuz
###################################################
data(fuzzydat)
f = fuzzylm(y ~ x, data = fuzzydat$lee)


###################################################
### code chunk number 4: GettingStarted.Rnw:52-53
###################################################
print(f)


###################################################
### code chunk number 5: pl (eval = FALSE)
###################################################
## plot(f, res = 20, col = "lightblue", main = "PLRLS")


###################################################
### code chunk number 6: GettingStarted.Rnw:63-65
###################################################
data(fuzzydat)
f = fuzzylm(y ~ x, data = fuzzydat$lee)
plot(f, res = 20, col = "lightblue", main = "PLRLS")


###################################################
### code chunk number 7: GettingStarted.Rnw:79-80
###################################################
summary(f)


###################################################
### code chunk number 8: TFNfig (eval = FALSE)
###################################################
## plot(1, type = "n", xlim = c(0,3), ylim=c(0,1.1), xlab = expression(italic("x")),
## ylab = "degree of membership", las = 1)
## points(matrix(c(.5,1.5,2.5,1,1,1), ncol=2), pch=19)
## text(c(.5,1.5,2.5),1, labels=as.expression(lapply(LETTERS[1:3], function(x) bquote(italic(.(x))))),pos=2)
## segments(.5,0,.5,1,lty=2)
## segments(1.5,0,1.5,1,lty=2)
## segments(2.5,0,2.5,1, lty=2)
## segments(.7,0,1.5,1)
## segments(1.9,0,1.5,1)
## segments(2,0,2.5,1)
## segments(3,0,2.5,1)


###################################################
### code chunk number 9: GettingStarted.Rnw:125-126
###################################################
plot(1, type = "n", xlim = c(0,3), ylim=c(0,1.1), xlab = expression(italic("x")),
ylab = "degree of membership", las = 1)
points(matrix(c(.5,1.5,2.5,1,1,1), ncol=2), pch=19)
text(c(.5,1.5,2.5),1, labels=as.expression(lapply(LETTERS[1:3], function(x) bquote(italic(.(x))))),pos=2)
segments(.5,0,.5,1,lty=2)
segments(1.5,0,1.5,1,lty=2)
segments(2.5,0,2.5,1, lty=2)
segments(.7,0,1.5,1)
segments(1.9,0,1.5,1)
segments(2,0,2.5,1)
segments(3,0,2.5,1)


###################################################
### code chunk number 10: A (eval = FALSE)
###################################################
## A = c(0.5, 0, 0)


###################################################
### code chunk number 11: B (eval = FALSE)
###################################################
## B = c(1.5, 0.8, 0.4)
## C = c(2.5, 0.5, 0.5)


###################################################
### code chunk number 12: GettingStarted.Rnw:174-181
###################################################
require(FuzzyNumbers)
B1 = FuzzyNumber(0.7, 1.5, 1.5, 1.9,
		left = function(x) x,
		right = function(x) 1 - x,
		lower = function(a) a,
		upper = function(a) 1 - a)
B1


###################################################
### code chunk number 13: GettingStarted.Rnw:190-194
###################################################
xc = core(B1)[1]
l = xc - supp(B1)[1]
r = supp(B1)[2] - xc
c(xc, l, r)


###################################################
### code chunk number 14: GettingStarted.Rnw:196-198
###################################################
detach("package:FuzzyNumbers", unload=TRUE)
require(fuzzyreg)


###################################################
### code chunk number 15: GettingStarted.Rnw:292-293
###################################################
fuzzydat$nas


###################################################
### code chunk number 16: GettingStarted.Rnw:305-308
###################################################
f2 = fuzzylm(formula = y ~ x, data = fuzzydat$nas,
             fuzzy.left.x = "xl",
             fuzzy.left.y = "yl", method = "moflr")


###################################################
### code chunk number 17: GettingStarted.Rnw:317-320
###################################################
f3 = fuzzylm(y ~ x, data = fuzzydat$nas,
             fuzzy.left.y = "yl",
             fuzzy.right.y = "yl", method = "fls")


###################################################
### code chunk number 18: GettingStarted.Rnw:335-337
###################################################
pred2 = predict(f2)
pred2$y


###################################################
### code chunk number 19: figTEF (eval = FALSE)
###################################################
## par(mfrow=c(1,2))
## plot(f2, res=20, col.fuzzy="lightblue", main = "f2 - MOFLR")
## plot(f3, res=20, col.fuzzy = "lightblue", main = "f3 - FLS")


###################################################
### code chunk number 20: GettingStarted.Rnw:368-369
###################################################
par(mfrow=c(1,2))
plot(f2, res=20, col.fuzzy="lightblue", main = "f2 - MOFLR")
plot(f3, res=20, col.fuzzy = "lightblue", main = "f3 - FLS")


###################################################
### code chunk number 21: GettingStarted.Rnw:379-381
###################################################
TEF(f2)
TEF(f3)


###################################################
### code chunk number 22: regfig (eval = FALSE)
###################################################
## par(mfrow=c(1,2))
## f4 = fuzzylm(y~x, fuzzydat$lee, method="plrls")
## plot(f4, res=20, col.fuzzy="lightblue", main="PLRLS")
## f1 = lm(y~x, fuzzydat$lee)
## newx = seq(min(fuzzydat$lee$x), max(fuzzydat$lee$y), length.out = 500)
## conf1 = predict(f1, newdata=data.frame(x=newx),
##                 interval="confidence")
## plot(fuzzydat$lee$x, fuzzydat$lee$y, xlab = "x", ylab = "y", main="LS")
## abline(f1)
## lines(newx, conf1[,2], lty=2)
## lines(newx, conf1[,3], lty=2)


###################################################
### code chunk number 23: GettingStarted.Rnw:416-417
###################################################
par(mfrow=c(1,2))
f4 = fuzzylm(y~x, fuzzydat$lee, method="plrls")
plot(f4, res=20, col.fuzzy="lightblue", main="PLRLS")
f1 = lm(y~x, fuzzydat$lee)
newx = seq(min(fuzzydat$lee$x), max(fuzzydat$lee$y), length.out = 500)
conf1 = predict(f1, newdata=data.frame(x=newx),
                interval="confidence")
plot(fuzzydat$lee$x, fuzzydat$lee$y, xlab = "x", ylab = "y", main="LS")
abline(f1)
lines(newx, conf1[,2], lty=2)
lines(newx, conf1[,3], lty=2)


###################################################
### code chunk number 24: GettingStarted.Rnw:452-453 (eval = FALSE)
###################################################
## ?plrls


