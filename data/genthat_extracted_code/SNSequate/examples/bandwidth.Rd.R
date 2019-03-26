library(SNSequate)


### Name: bandwidth
### Title: Automatic selection of the bandwidth parameter 'h'
### Aliases: bandwidth bandwidth.default
### Keywords: kernel equating

### ** Examples

#Example: The "Standard" column and firsts two rows of Table 10.1 in 
#Chapter 10 of Von Davier 2011

data(Math20EG)

hx.logis<-bandwidth(scores=Math20EG[,1],kert="logis",degree=2,design="EG")$h
hx.unif<-bandwidth(scores=Math20EG[,1],kert="unif",degree=2,design="EG")$h 
hx.gauss<-bandwidth(scores=Math20EG[,1],kert="gauss",degree=2,design="EG")$h

hy.logis<-bandwidth(scores=Math20EG[,2],kert="logis",degree=3,design="EG")$h
hy.unif<-bandwidth(scores=Math20EG[,2],kert="unif",degree=3,design="EG")$h 
hy.gauss<-bandwidth(scores=Math20EG[,2],kert="gauss",degree=3,design="EG")$h

partialTable10.1<-rbind(c(hx.logis,hx.unif,hx.gauss),
				c(hy.logis,hy.unif,hy.gauss))

dimnames(partialTable10.1)<-list(c("h.x","h.y"),c("Logistic","Uniform","Gaussian"))
partialTable10.1




