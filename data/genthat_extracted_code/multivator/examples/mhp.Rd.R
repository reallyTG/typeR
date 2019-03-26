library(multivator)


### Name: mhp
### Title: Multivatriate hyperparameter (mhp) objects
### Aliases: mhp mhp-class is.mhp M B M<- B<- as.mhp as.mhp,mdm-method
###   as.mhp,experiment-method names summary,mhp-method summary
###   names,mhp-method names<-,mhp-method levels levels,mhp-method
###   levels<-,mhp-method types,mhp-method types<-,mhp-method
###   print.mhpSummary

### ** Examples


hp <- mhp(M=diag(2),B=array(c(diag(3),diag(3)),c(3,3,2)),
names=letters[1:3],levels=c("oak","ash"))
M(hp)
B(hp)[1,1,1] <- 30  # try a negative value and see what happens
names(hp)
names(hp) <-  c("Alice","Zachy","Annabel")
levels(hp) <- c("squid","snail")
summary(hp)




