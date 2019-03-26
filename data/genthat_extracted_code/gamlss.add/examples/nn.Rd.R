library(gamlss.add)


### Name: nn
### Title: A interface function to use nnet() function within GAMLSS
### Aliases: nn nn.control
### Keywords: regression

### ** Examples

library(nnet)
data(rock)
area1<- with(rock,area/10000)
peri1<- with (rock,peri/10000) 
rock1<- with(rock, data.frame(perm, area=area1, peri=peri1, shape))
# fit nnet
r1 <- nnet(log(perm)~area+peri+shape, rock1, size=3, decay=1e-3, linout=TRUE, 
            skip=TRUE, max=1000, Hess=TRUE)
summary(r1) 
# get gamlss
library(gamlss) 
cc <- nn.control(size=3, decay=1e-3, linout=TRUE, skip=TRUE, max=1000, 
      Hess=TRUE)
g1 <- gamlss(log(perm)~nn(~area+peri+shape,size=3, control=cc), data=rock1)
summary(g1$mu.coefSmo[[1]])
# predict
Xp <- expand.grid(area=seq(0.1,1.2,0.05), peri=seq(0,0.5, 0.02), shape=0.2)
rocknew <- cbind(Xp, fit=predict(r1, newdata=Xp))
library(lattice)
wf1<-wireframe(fit~area+peri, rocknew, screen=list(z=160, x=-60), 
               aspect=c(1, 0.5), drape=TRUE,  main="nnet()")
rocknew1 <- cbind(Xp, fit=predict(g1, newdata=Xp))
wf2<-wireframe(fit~area+peri, rocknew1, screen=list(z=160, x=-60), 
               aspect=c(1, 0.5), drape=TRUE,  main="nn()")
print(wf1, split=c(1,1,2,1), more=TRUE)
print(wf2, split=c(2,1,2,1))
#--------------------------------------------------------------------------------------- 
 data(rent)
 mr1 <- gamlss(R~nn(~Fl+A, size=5, decay=0.001), data=rent, family=GA)  
 library(gamlss.add)
 mg1<-gamlss(R~ga(~s(Fl,A)), data=rent, family=GA) 
 AIC(mr1,mg1)
newrent <- newrent1 <-newrent2 <- data.frame(expand.grid(Fl=seq(30,120,5),
                   A=seq(1890,1990,5 )))
newrent1$fit <- predict(mr1, newdata=newrent, type="response") ##nn
newrent2$fit <- predict(mg1, newdata=newrent, type="response")# gam
 library(lattice)
 wf1<-wireframe(fit~Fl+A, newrent1, aspect=c(1,0.5), drape=TRUE, 
                colorkey=(list(space="right", height=0.6)), main="nn()")
 wf2<-wireframe(fit~Fl+A, newrent2, aspect=c(1,0.5), drape=TRUE, 
                colorkey=(list(space="right", height=0.6)), main="ga()")
print(wf1, split=c(1,1,2,1), more=TRUE)
print(wf2, split=c(2,1,2,1))
#----------------------------------------------------------------------------------------
## Not run: 
##D data(db)
##D mdb1 <- gamlss(head~nn(~age,size=20, decay=0.001), data=db)
##D plot(head~age, data=db)
##D points(fitted(mdb1)~db$age, col="red")
##D 
##D # do not run
##D #mdb2 <- gamlss(head~nn(~age,size=20, decay=0.001), data=db, family=BCT)
##D #plot(head~age, data=db)
##D #points(fitted(mdb2)~db$age, col="red")
## End(Not run)



