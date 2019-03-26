### R code from vignette source 'POT.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: POT.Rnw:305-312
###################################################
library(POT)
rgpd(5, loc = 1, scale = 2, shape = -0.2)
rgpd(6, c(1, -5), 2, -0.2)
rgpd(6, 0, c(2, 3), 0)
pgpd(c(9, 15, 20), 1, 2, 0.25)
qgpd(c(.25, .5, .75), 1, 2, 0)
dgpd(c(9, 15, 20), 1, 2, 0.25)


###################################################
### code chunk number 2: POT.Rnw:379-380
###################################################
x <- runif(10000)


###################################################
### code chunk number 3: tcplot
###################################################
par(mfrow=c(1,2))
tcplot(x, u.range = c(0.9, 0.995))


###################################################
### code chunk number 4: POT.Rnw:390-391
###################################################
par(mfrow=c(1,2))
tcplot(x, u.range = c(0.9, 0.995))


###################################################
### code chunk number 5: POT.Rnw:455-456
###################################################
x <- rnorm(10000)


###################################################
### code chunk number 6: mrlplot
###################################################
mrlplot(x, u.range = c(1, quantile(x, probs = 0.995)),
 col = c("green", "black", "green"), nt = 200)


###################################################
### code chunk number 7: POT.Rnw:466-467
###################################################
mrlplot(x, u.range = c(1, quantile(x, probs = 0.995)),
 col = c("green", "black", "green"), nt = 200)


###################################################
### code chunk number 8: POT.Rnw:509-510
###################################################
x <- c(1 - abs(rnorm(200, 0, 0.2)), rgpd(100, 1, 2, 0.25))


###################################################
### code chunk number 9: lmomplot
###################################################
lmomplot(x, u.range = c(0.9, quantile(x, probs = 0.9)), identify = FALSE)


###################################################
### code chunk number 10: POT.Rnw:518-519
###################################################
lmomplot(x, u.range = c(0.9, quantile(x, probs = 0.9)), identify = FALSE)


###################################################
### code chunk number 11: diplot
###################################################
data(ardieres)
events <- clust(ardieres, u = 2, tim.cond = 8 / 365, clust.max = TRUE)
diplot(events, u.range = c(2, 20))


###################################################
### code chunk number 12: POT.Rnw:581-582
###################################################
data(ardieres)
events <- clust(ardieres, u = 2, tim.cond = 8 / 365, clust.max = TRUE)
diplot(events, u.range = c(2, 20))


###################################################
### code chunk number 13: POT.Rnw:622-633
###################################################
x <- rgpd(200, 1, 2, 0.25)                             
mom <- fitgpd(x, 1, "moments")$param                        
mle <- fitgpd(x, 1, "mle")$param                       
pwmu <- fitgpd(x, 1, "pwmu")$param                     
pwmb <- fitgpd(x, 1, "pwmb")$param                     
pickands <- fitgpd(x, 1, "pickands")$param             
med <- fitgpd(x, 1, "med", start = list(scale = 2, shape = 0.25))$param          
mdpd <- fitgpd(x, 1, "mdpd")$param    
mple <- fitgpd(x, 1, "mple")$param
ad2r <- fitgpd(x, 1, "mgf", stat = "AD2R")$param                
print(rbind(mom, mle, pwmu, pwmb, pickands, med, mdpd, mple, ad2r))


###################################################
### code chunk number 14: POT.Rnw:640-643
###################################################
x <- rgpd(100, 1, 2, 0)
fitgpd(x, thresh = 1, shape = 0, est = "mle")
fitgpd(x, thresh = 1, scale = 2, est = "mle")


###################################################
### code chunk number 15: POT.Rnw:648-650
###################################################
x <- rgpd(500, 1:2, 0.3, 0.01)
fitgpd(x, 1:2, est = "mle")


###################################################
### code chunk number 16: POT.Rnw:664-668
###################################################
x <- rgpd(500, 0, 1, 0.25)
y <- rgpd(500, 2, 0.5, -0.25)
Mlog <- fitbvgpd(cbind(x,y), c(0,2), model = "log")
Mlog


###################################################
### code chunk number 17: POT.Rnw:683-684
###################################################
fitbvgpd(cbind(x,y), c(0,2), model = "log", alpha = 1)


###################################################
### code chunk number 18: pickdep
###################################################
pickdep(Mlog)


###################################################
### code chunk number 19: POT.Rnw:701-702
###################################################
pickdep(Mlog)


###################################################
### code chunk number 20: POT.Rnw:741-744
###################################################
mc <- simmc(1000, alpha = 0.5, model = "log")
mc <- qgpd(mc, 2, 1, 0.15)
fitmcgpd(mc, 2, "log")


###################################################
### code chunk number 21: POT.Rnw:758-767
###################################################
x <- rgpd(200, 1, 2, 0.25)
mle <- fitgpd(x, 1, est = "mle")
mom <- fitgpd(x, 1, est = "moments")
pwmb <- fitgpd(x, 1, est = "pwmb")
pwmu <- fitgpd(x, 1, est = "pwmu")
gpd.fiscale(mle, conf = 0.9)
gpd.fiscale(mom, conf = 0.9)
gpd.fiscale(pwmu, conf = 0.9)
gpd.fiscale(pwmb, conf = 0.9)


###################################################
### code chunk number 22: pfci
###################################################
par(mfrow=c(1,2))
gpd.pfscale(mle, range = c(1, 2.9), conf = 0.9)
gpd.pfshape(mle, range = c(0, 0.6), conf = 0.85)


###################################################
### code chunk number 23: POT.Rnw:786-787
###################################################
par(mfrow=c(1,2))
gpd.pfscale(mle, range = c(1, 2.9), conf = 0.9)
gpd.pfshape(mle, range = c(0, 0.6), conf = 0.85)


###################################################
### code chunk number 24: pfrl
###################################################
gpd.firl(pwmu, prob = 0.95)
gpd.pfrl(mle, prob = 0.95, range = c(5, 16))


###################################################
### code chunk number 25: POT.Rnw:803-804
###################################################
gpd.firl(pwmu, prob = 0.95)
gpd.pfrl(mle, prob = 0.95, range = c(5, 16))


###################################################
### code chunk number 26: POT.Rnw:830-831
###################################################
x <- rgpd(200, 10, 0.5, -0.2)


###################################################
### code chunk number 27: plotgpd
###################################################
fitted <- fitgpd(x, 10, est = "mle")
par(mfrow=c(2,2))
plot(fitted, npy = 1)


###################################################
### code chunk number 28: POT.Rnw:842-843
###################################################
fitted <- fitgpd(x, 10, est = "mle")
par(mfrow=c(2,2))
plot(fitted, npy = 1)


###################################################
### code chunk number 29: POT.Rnw:867-869
###################################################
plot(fitted, which = 1)
pp(fitted)


###################################################
### code chunk number 30: POT.Rnw:904-906
###################################################
data(ardieres)
events <- clust(ardieres, u = 2, tim.cond = 8 / 365)


###################################################
### code chunk number 31: clust
###################################################
clustMax <- clust(ardieres, u = 2, tim.cond = 8 / 365, clust.max = TRUE, plot = TRUE, xlim = c(1971.1, 1972.9))


###################################################
### code chunk number 32: POT.Rnw:922-923
###################################################
clustMax <- clust(ardieres, u = 2, tim.cond = 8 / 365, clust.max = TRUE, plot = TRUE, xlim = c(1971.1, 1972.9))


###################################################
### code chunk number 33: POT.Rnw:939-941
###################################################
rp2prob(50, 1.8)
prob2rp(0.6, 2.2)


###################################################
### code chunk number 34: POT.Rnw:947-949
###################################################
x <- runif(50)
samlmu(x, nmom = 5)


###################################################
### code chunk number 35: ts2tsd
###################################################
data(ardieres)
tsd <- ts2tsd(ardieres, 3 / 365)
plot(ardieres, type = "l", col = "blue")
lines(tsd, col = "green")


###################################################
### code chunk number 36: POT.Rnw:968-969
###################################################
data(ardieres)
tsd <- ts2tsd(ardieres, 3 / 365)
plot(ardieres, type = "l", col = "blue")
lines(tsd, col = "green")


###################################################
### code chunk number 37: threshSelect
###################################################
summary(ardieres)
events0 <- clust(ardieres, u = 1.5, tim.cond = 8/365, clust.max = TRUE)
par(mfrow=c(2,2))
mrlplot(events0[,"obs"])
abline( v = 6, col = "green")
diplot(events0)
abline( v = 6, col = "green")
tcplot(events0[,"obs"], which = 1)
abline( v = 6, col = "green")
tcplot(events0[,"obs"], which = 2)
abline( v = 6, col = "green")


###################################################
### code chunk number 38: POT.Rnw:1013-1014
###################################################
summary(ardieres)
events0 <- clust(ardieres, u = 1.5, tim.cond = 8/365, clust.max = TRUE)
par(mfrow=c(2,2))
mrlplot(events0[,"obs"])
abline( v = 6, col = "green")
diplot(events0)
abline( v = 6, col = "green")
tcplot(events0[,"obs"], which = 1)
abline( v = 6, col = "green")
tcplot(events0[,"obs"], which = 2)
abline( v = 6, col = "green")


###################################################
### code chunk number 39: POT.Rnw:1025-1031
###################################################
events1 <- clust(ardieres, u = 6, tim.cond = 8/365, clust.max = TRUE)
npy <- length(events1[,"obs"]) / (diff(range(ardieres[,"time"], na.rm
= TRUE)) - diff(ardieres[c(20945,20947),"time"])) 
##Because there is a gap !!!
print(npy)
attributes(events1)$exi


###################################################
### code chunk number 40: checkArdieres
###################################################
mle <- fitgpd(events1[,"obs"], thresh = 6, est = "mle")
par(mfrow=c(2,2))
plot(mle, npy = npy)


###################################################
### code chunk number 41: POT.Rnw:1049-1050
###################################################
mle <- fitgpd(events1[,"obs"], thresh = 6, est = "mle")
par(mfrow=c(2,2))
plot(mle, npy = npy)


###################################################
### code chunk number 42: POT.Rnw:1060-1064
###################################################
##First convert return period in prob
rp2prob(retper = 100, npy = npy)
prob <- rp2prob(retper = 100, npy = npy)[,"prob"]
qgpd(prob, loc = 6, scale = mle$param["scale"], shape = mle$param["shape"]) 


###################################################
### code chunk number 43: pfrlArdieres
###################################################
gpd.pfrl(mle, prob, range = c(25, 100), nrang = 200)


###################################################
### code chunk number 44: POT.Rnw:1076-1077
###################################################
gpd.pfrl(mle, prob, range = c(25, 100), nrang = 200)


###################################################
### code chunk number 45: POT.Rnw:1086-1092
###################################################
maxEvent <- max(events1[,"obs"])
maxEvent
prob <- pgpd(maxEvent, loc = 6, scale = mle$param["scale"], shape =
mle$param["shape"]) 
prob
prob2rp(prob, npy = npy)


