library(tatest)


### Name: tatest-package
### Title: Two-Group T_alpha-Test
### Aliases: tatest-package
### Keywords: tatest

### ** Examples

X<-c(112,122,108,127)
Y<-c(302, 314,322,328)
dat<-cbind(X,Y)
ta.test(X=dat,na=4,nb=4, eqv=TRUE, paired=FALSE, 
alpha=0.05, alternative = "two.sided",LOG="NULL")
t.test(x=X,y=Y)
ttest(X,Y,alternative = "two.sided", LG = "NULL")



