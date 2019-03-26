library(tsDyn)


### Name: IIPUs
### Title: US monthly industrial production from Hansen (1999)
### Aliases: IIPUs
### Keywords: datasets

### ** Examples

data(IIPUs)
end(IIPUs) #not same date as in the paper
plot(IIPUs)#exactly same graph as in the paper
sel<-selectSETAR(IIPUs, m=16, thDelay=5, criterion="SSR", trim=0.1, plot=FALSE)
sel #R function obtains a lower SSR with another thresold
plot(sel)
setar(IIPUs, m=16, thDelay=5, trim=0.1, th=sel$th)

sel2<-selectSETAR(IIPUs, m=16, thDelay=5, criterion="SSR", trim=0.1, plot=FALSE, nthresh=2)
sel2
#all results agree
set2<-setar(IIPUs, m=16, thDelay=5, th=sel2$th, trim=0.1)
#most of the results agree, except constant in the low regime which has opposed signs!
summary(set2)

#this is obviously a error in Hansen, see:
XX<-embed(IIPUs, 17)
Y<-XX[,1]
X<-XX[,-1]
dummyDown<-ifelse(X[,6]<= -2.5, 1,0)
sum(dummyDown)
M<-cbind(1*dummyDown,X*dummyDown )
lm(Y~M-1)

## see the test functions (not run, due to long computing time, even with small nboot
## Not run: 
##D   setarTest(IIPUs, m=16, thDelay=5, nboot=10, check=TRUE)
##D   #because of the discrepency. test1vs2 does not correspond, test 1vs3 conforms
##D   setarTest(IIPUs, m=16, thDelay=5, nboot=10, check=TRUE, test="2vs3")
##D   #test 2vs3 is also different of the version in the article (27)
## End(Not run)




