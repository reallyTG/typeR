### R code from vignette source 'AFLRatings.Rnw'

###################################################
### code chunk number 1: AFLRatings.Rnw:43-49
###################################################
library(PlayerRatings)
afl <- aflodds[,c(2,3,4,7)]
train <- afl[afl$Week < 100,]
test <- afl[afl$Week >= 100 & afl$Week < 150,]
valid <- afl[afl$Week >= 150,]
head(train,12)


###################################################
### code chunk number 2: AFLRatings.Rnw:54-56
###################################################
sobj <- steph(train[train$Week==1,])
for(i in 2:80) sobj <- steph(train[train$Week==i,], sobj$ratings)


###################################################
### code chunk number 3: AFLRatings.Rnw:61-63
###################################################
sobj <- steph(train, history = TRUE)
sobj


###################################################
### code chunk number 4: stabilize
###################################################
plot(sobj, npl=16)
abline(v=c(27,55),lty=2,lwd=2,col="grey")
text(c(14,42),c(2500,2500),c("2009","2010"),cex=1.5)


###################################################
### code chunk number 5: AFLRatings.Rnw:78-79
###################################################
plot(sobj, npl=16)
abline(v=c(27,55),lty=2,lwd=2,col="grey")
text(c(14,42),c(2500,2500),c("2009","2010"),cex=1.5)


###################################################
### code chunk number 6: AFLRatings.Rnw:89-92
###################################################
test1 <- test[test$Week==min(test$Week),]
pred <- predict(sobj, test1, trat = c(1900,300), thresh = 0.5)
cbind(test1, Predict = pred)


###################################################
### code chunk number 7: AFLRatings.Rnw:97-109
###################################################
sobj <- steph(train, init = c(2200,300), cval = 8, 
  hval = 8, lambda = 5)
pred <- NULL
for(i in unique(test$Week)) {
  testi <- test[test$Week == i,]
  predi <- predict(sobj, testi, trat = c(1900,300), gamma = 30, 
    thresh = 0.5)
  pred <- c(pred, predi)
  sobj <- steph(testi, sobj$ratings, init = c(2200,300), cval = 8, 
    hval = 8, lambda = 5)
}
table(Result=test$Score, Predictions=pred)


###################################################
### code chunk number 8: AFLRatings.Rnw:116-123
###################################################
trav <- function(dat) {
  teams <- sort(unique(afl$HomeTeam))
  locs <- c("Ade","Bri","Mel","Mel","Mel","Per","Gel","Bri","Syd",
    "Mel","Mel","Mel","Ade","Mel","Mel","Syd","Per","Mel")
  (locs[factor(dat$HomeTeam,levels=teams)] 
    != locs[factor(dat$AwayTeam,levels=teams)])
}


###################################################
### code chunk number 9: AFLRatings.Rnw:128-144
###################################################
st0 <- data.frame(Player=sort(unique(train$HomeTeam)), Rating=2200, 
  Deviation=300, stringsAsFactors=FALSE)
sobj <- steph(train, st0, init = c(1900,300), cval = 8, 
  hval = 8, lambda = 5)
pred <- NULL
for(i in unique(test$Week)) {
  testi <- test[test$Week == i,]
  predi <- predict(sobj, testi, trat = c(1900,300), 
    gamma = 30*trav(testi), thresh = 0.5)
  pred <- c(pred, predi)
  sobj <- steph(testi, sobj$ratings, init = c(1900,300), cval = 8, 
    hval = 8, lambda = 5)
}
rp <- table(Result=test$Score, Predictions=pred)
rp
round(100*(rp[1,2]+rp[nrow(rp),1])/sum(rp), 2)


###################################################
### code chunk number 10: AFLRatings.Rnw:149-166
###################################################
st0 <- data.frame(Player=sort(unique(train$HomeTeam)), Rating=2200, 
  Deviation=300, stringsAsFactors=FALSE)
sobj <- steph(rbind(train,test), st0, init = c(1900,300), cval = 8, 
  hval = 8, lambda = 5)
pred <- NULL
for(i in unique(valid$Week)) {
  testi <- valid[valid$Week == i,]
  predi <- predict(sobj, testi, trat = c(1900,300), 
    gamma = 30*trav(testi), thresh = 0.5)
  pred <- c(pred, predi)
  sobj <- steph(testi, sobj$ratings, init = c(1900,300), cval = 8, 
    hval = 8, lambda = 5)
}
rp <- table(Result=valid$Score, Predictions=pred)
rp
round(100*(rp[1,2]+rp[nrow(rp),1])/sum(rp), 2)
sobj


###################################################
### code chunk number 11: AFLRatings.Rnw:173-176
###################################################
sobj <- steph(rbind(train,test,valid), st0, init = c(1900,300), cval = 8, 
  hval = 8, lambda = 5, history = TRUE)
p1 <- sobj$ratings[1:8,1]; p2 <- sobj$ratings[9:16,1]


###################################################
### code chunk number 12: ratings1
###################################################
plot(sobj, t0 = 40, players = p1, ylim = c(2050,2350),lwd = 2)
abline(v=c(55,83),lty=2,lwd=2,col="grey")
legend(70,2160,p1,lty=1:5,col=1:6,lwd=3,cex=0.8)
text(c(47,70,90),rep(2320,3),c("2010","2011","2012"),cex=1.5)


###################################################
### code chunk number 13: ratings2
###################################################
plot(sobj, t0 = 40, players = p2, ylim = c(2050,2350),lwd = 2)
abline(v=c(55,83),lty=2,lwd=2,col="grey")
legend(68,2350,p2,lty=1:5,col=1:6,lwd=3,cex=0.8)
text(c(47,70,90),rep(2070,3),c("2010","2011","2012"),cex=1.5)


###################################################
### code chunk number 14: AFLRatings.Rnw:193-194
###################################################
plot(sobj, t0 = 40, players = p1, ylim = c(2050,2350),lwd = 2)
abline(v=c(55,83),lty=2,lwd=2,col="grey")
legend(70,2160,p1,lty=1:5,col=1:6,lwd=3,cex=0.8)
text(c(47,70,90),rep(2320,3),c("2010","2011","2012"),cex=1.5)


###################################################
### code chunk number 15: AFLRatings.Rnw:203-204
###################################################
plot(sobj, t0 = 40, players = p2, ylim = c(2050,2350),lwd = 2)
abline(v=c(55,83),lty=2,lwd=2,col="grey")
legend(68,2350,p2,lty=1:5,col=1:6,lwd=3,cex=0.8)
text(c(47,70,90),rep(2070,3),c("2010","2011","2012"),cex=1.5)


###################################################
### code chunk number 16: AFLRatings.Rnw:215-222
###################################################
library(PlayerRatings)
afl <- aflodds[,c(2,3,4,7)]
train <- afl[afl$Week < 100,]
test <- afl[afl$Week >= 100 & afl$Week < 150,]
valid <- afl[afl$Week >= 150,]
sobj <- glicko2(train, history = TRUE)
print(sobj, cols=1:4)


###################################################
### code chunk number 17: stabilize2
###################################################
plot(sobj, npl=16)
abline(v=c(27,55),lty=2,lwd=2,col="grey")
text(c(14,42),c(2500,2500),c("2009","2010"),cex=1.5)


###################################################
### code chunk number 18: AFLRatings.Rnw:235-236
###################################################
plot(sobj, npl=16)
abline(v=c(27,55),lty=2,lwd=2,col="grey")
text(c(14,42),c(2500,2500),c("2009","2010"),cex=1.5)


###################################################
### code chunk number 19: AFLRatings.Rnw:246-261
###################################################
st0 <- data.frame(Player=sort(unique(train$HomeTeam)), Rating=2200, 
  Deviation=300, Volatility=0.15, stringsAsFactors=FALSE)
sobj <- glicko2(train, st0, init = c(1900,300,0.15), tau = 1.2)
pred <- NULL
for(i in unique(test$Week)) {
  testi <- test[test$Week == i,]
  predi <- predict(sobj, testi, trat = c(1900,300), 
    gamma = 30*trav(testi), thresh = 0.5)
  pred <- c(pred, predi)
  sobj <- glicko2(testi, sobj$ratings, init = c(1900,300,0.15), 
    tau = 1.2)
}
rp <- table(Result=test$Score, Predictions=pred)
rp
round(100*(rp[1,2]+rp[nrow(rp),1])/sum(rp), 2)


