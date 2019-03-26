library(samr)


### Name: SAM
### Title: Significance analysis of microarrays - simple user interface
### Aliases: SAM
### Keywords: univar survival ts nonparametric

### ** Examples


######### two class unpaired comparison
# y must take values 1,2

set.seed(100)
x<-matrix(rnorm(1000*20),ncol=20)
dd<-sample(1:1000,size=100)

u<-matrix(2*rnorm(100),ncol=10,nrow=100)
x[dd,11:20]<-x[dd,11:20]+u
y<-c(rep(1,10),rep(2,10))

samfit<-SAM(x,y,resp.type="Two class unpaired")

# examine significant gene list

print(samfit)

# plot results
plot(samfit)

########### two class paired

# y must take values  -1, 1, -2,2 etc, with (-k,k) being a pair

set.seed(100)
x<-matrix(rnorm(1000*20),ncol=20)
dd<-sample(1:1000,size=100)

u<-matrix(2*rnorm(100),ncol=10,nrow=100)
x[dd,11:20]<-x[dd,11:20]+u

y=c(-(1:10),1:10)



samfit<-SAM(x,y, resp.type="Two class paired",fdr.output=.25)




#############quantitative response


set.seed(30)
p=1000
x<-matrix(rnorm(p*20),ncol=20)
y<-rnorm(20)
x[1:20,y>0]=x[1:20,y>0]+4
a<-SAM(x,y,resp.type="Quantitative",nperms=50,fdr.output=.5)






###########survival data
# y is numeric; censoring.status=1 for failures, and 0 for censored

set.seed(84048)
x=matrix(rnorm(1000*50),ncol=50)
x[1:50,26:50]= x[1:50,26:50]+2
x[51:100,26:50]= x[51:100,26:50]-2

y=abs(rnorm(50))
y[26:50]=y[26:50]+2
censoring.status <- sample(c(0,1),size=50,replace=TRUE)

a<-SAM(x,y,censoring.status=censoring.status,resp.type="Survival",
nperms=20)



################multi-class example
# y takes values 1,2,3,...k where k= number of classes

set.seed(84048)
x=matrix(rnorm(1000*10),ncol=10)

y=c(rep(1,3),rep(2,3),rep(3,4))
x[1:50,y==3]=x[1:50,y==3]+5

a <- SAM(x,y,resp.type="Multiclass",nperms=50)






##################### pattern discovery
# here there is no outcome y; the desired eigengene is indicated by 
# the argument eigengene.numbe in the data object

set.seed(32)
x=matrix(rnorm(1000*9),ncol=9)
mu=c(3,2,1,0,0,0,1,2,3)
b=3*runif(100)+.5
x[1:100,]=x[1:100,]+ b



d=list(x=x,eigengene.number=1,
geneid=as.character(1:nrow(x)),genenames=paste("gene", as.character(1:nrow(x))))


a <- SAM(x, resp.type="Pattern discovery", nperms=50)


#################### timecourse data

# elements of y are of the form  kTimet  where k is the class label and t
# is the time; in addition, the   suffixes Start or End indicate the first
# and last observation in a given time course
# the class label can be that for a two class unpaired, one class or
# two class paired problem

set.seed(8332)
y=paste(c(rep(1,15),rep(2,15)),"Time",rep(c(1,2,3,4,5,1.1,2.5, 3.7, 4.1,5.5),3),
sep="")
start=c(1,6,11,16,21,26)
for(i in start){
y[i]=paste(y[i],"Start",sep="")
}
for(i in  start+4){
y[i]=paste(y[i],"End",sep="")
}
x=matrix(rnorm(1000*30),ncol=30)
x[1:50,16:20]=x[1:50,16:20]+matrix(3*c(0,1,2,3,4),ncol=5,nrow=50,byrow=TRUE)
x[1:50,21:25]=x[1:50,21:25]+matrix(3*c(0,1,2,3,4),ncol=5,nrow=50,byrow=TRUE)
x[1:50,26:30]=x[1:50,26:30]+matrix(3*c(0,1,2,3,4),ncol=5,nrow=50,byrow=TRUE)

x[51:100,16:20]=x[51:100,16:20]-matrix(3*c(0,1,2,3,4),ncol=5,nrow=50,byrow=TRUE)
x[51:100,21:25]=x[51:100,21:25]-matrix(3*c(0,1,2,3,4),ncol=5,nrow=50,byrow=TRUE)
x[51:100,26:30]=x[51:100,26:30]-matrix(3*c(0,1,2,3,4),ncol=5,nrow=50,byrow=TRUE)

a<- SAM(x,y,  resp.type="Two class unpaired timecourse",
 nperms=100, time.summary.type="slope")





