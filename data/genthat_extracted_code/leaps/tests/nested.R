library(leaps)
set.seed(1)
x = rnorm(100)
e = rnorm(100)
y = 1 + 1 * x + 1 * x^2 + 1 * x^3 + e
fakedata <- y
for (i in 1:10) {
  newvar = x^i
  fakedata <- cbind(fakedata,newvar)
  colnames(fakedata)[i+1] <- paste0("x",i)
}
fakedata <- data.frame(fakedata)
colnames(fakedata)[1] <- c("y")

regfit.backward = regsubsets(y~.,data=fakedata,nvmax=10,method="backward")

rightwhich<-structure(c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 
TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 
TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, 
TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 
TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, 
TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, 
TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, 
TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, 
TRUE, TRUE, TRUE), .Dim = 10:11, .Dimnames = list(c("1", "2", 
"3", "4", "5", "6", "7", "8", "9", "10"), c("(Intercept)", "x1", 
"x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9", "x10")))

stopifnot(all.equal(summary(regfit.backward)$which, rightwhich))

m<-lm(y~x1+x4+x5,data=fakedata)

stopifnot(all.equal(coef(m),coef(regfit.backward,3)))
stopifnot(all.equal(vcov(m),vcov(regfit.backward,3)))

