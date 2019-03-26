### R code from vignette source 'mlegp.Rnw'

###################################################
### code chunk number 1: mlegp.Rnw:131-132
###################################################
library(mlegp)


###################################################
### code chunk number 2: mlegp.Rnw:138-143
###################################################
x = -5:5
z1 = 10 - 5*x + rnorm(length(x))
z2 = 7 * sin(x) + rnorm(length(x))
fitMulti = mlegp(x, cbind(z1,z2))
plot(fitMulti)


###################################################
### code chunk number 3: mlegp.Rnw:147-148
###################################################
plot(fitMulti)


###################################################
### code chunk number 4: mlegp.Rnw:154-154
###################################################



###################################################
### code chunk number 5: mlegp.Rnw:158-159
###################################################
fitMulti


###################################################
### code chunk number 6: mlegp.Rnw:162-163
###################################################
fitMulti[[1]]


###################################################
### code chunk number 7: mlegp.Rnw:167-170
###################################################
x = c(1:10, 1:10, 1:10)
y = x + rnorm(length(x), sd = 1)
fit = mlegp(x,y, nugget = 1, nugget.known = 1)


###################################################
### code chunk number 8: mlegp.Rnw:173-174
###################################################
fit = mlegp(x,y, nugget.known = 1)


###################################################
### code chunk number 9: mlegp.Rnw:176-177
###################################################
fit$nugget 


###################################################
### code chunk number 10: mlegp.Rnw:186-188
###################################################
x = seq(0,1,length.out=20)
z = x + rnorm(length(x), sd = 0.10*x)   # variance is not constant


###################################################
### code chunk number 11: mlegp.Rnw:194-195
###################################################
fit1 = mlegp(x,z, nugget = mean((0.1*x)**2))


###################################################
### code chunk number 12: mlegp.Rnw:198-199
###################################################
fit2 = mlegp(x,z, nugget = (.1*x)**2)


###################################################
### code chunk number 13: mlegp.Rnw:202-203
###################################################
fit3 = mlegp(x,z, nugget.known = 1, nugget = (.1*x)**2)


###################################################
### code chunk number 14: mlegp.Rnw:207-210
###################################################
sqrt(mean((x-predict(fit1))**2))
sqrt(mean((x-predict(fit2))**2))
sqrt(mean((x-predict(fit3))**2))


###################################################
### code chunk number 15: mlegp.Rnw:237-238
###################################################
library(mlegp)


###################################################
### code chunk number 16: mlegp.Rnw:240-246
###################################################
x = seq(-4,4,by=.05)
p = 1:10
y = matrix(0,length(p), length(x))
for (i in 1:length(p)) {
           y[i,] = sin(x) + .2*i + rnorm(length(x), sd  = .01)
}


###################################################
### code chunk number 17: mlegp.Rnw:248-253 (eval = FALSE)
###################################################
## ## we now have 10 functional observations (each of length 100) ##
## for (i in p) {
## 	plot(x,y[i,], type = "l", col = i, ylim = c(min(y), max(y)))
##         par(new=TRUE)
## }


###################################################
### code chunk number 18: mlegp.Rnw:257-262
###################################################
     ## we now have 10 functional observations (each of length 100) ##
     for (i in p) {
            plot(x,y[i,], type = "l", col = i, ylim = c(min(y), max(y)))
            par(new=TRUE)
     }


###################################################
### code chunk number 19: mlegp.Rnw:270-272
###################################################
     numPCs = 2
     singularValueImportance(t(y))[numPCs]


###################################################
### code chunk number 20: mlegp.Rnw:274-275
###################################################
     fitPC = mlegp(p, t(y), PC.num = numPCs)


###################################################
### code chunk number 21: mlegp.Rnw:278-283
###################################################
     ## reconstruct the output Y = UDV'
     Vprime = matrix(0,numPCs,length(p))
     Vprime[1,] = predict(fitPC[[1]])
     Vprime[2,] = predict(fitPC[[2]])
     predY = fitPC$UD %*% Vprime


