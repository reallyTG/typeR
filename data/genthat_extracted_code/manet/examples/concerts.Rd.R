library(manet)


### Name: concerts
### Title: Concerts synthetic network
### Aliases: concerts
### Keywords: datasets

### ** Examples

#DATA GENERATION
z_ext <-function(x,nfac){
 nq <- length(x)
 zx <- hcube(rep(nq,nfac))
 zx <- zx[,dim(zx)[2]:1]
 z2 <- matrix(x[zx],dim(zx)[1],dim(zx)[2])
 return(z2)
 }
K=3 # main clusters: Rock (cluster h=5), Pop (cluster h=3), Electronic (cluster h=2)
K_star=2^K
n=500 #attendees
set.seed(777)
u=z_ext(0:1,K)
alpha_star=rep(0,K_star)
alpha_star=c(0.05,0.10,0.35,0.15,0.25,0.00,0.10,0.00)
index=rep(0,n)
for(i in 1:n)
 index[i]=sample(1:K_star,1,prob=alpha_star)
d=14 #concerts/artists
y<-matrix(0,n,d)
colnames(y)=c("Blondie", "Fleetwood Mac", "Paramore","Queen","St.Vincent", "The Queen",
"Pet Shop Boys","M83","Daft Punk", "Goldfrapp", "Chvrches", "LaRoux", "Robyn","BANKS")
pi.greco=matrix(0,K,d)
rownames(pi.greco)=c("Rock","Pop","Electronic")
colnames(pi.greco)=colnames(y)
pi.greco[1,]=c(0.80,0.80,0.80,0.70,0.90,0.80,0.10,0.10,0.05,0.05,0.10,0.05,0.05,0.10)
pi.greco[2,]=c(0.10,0.10,0.90,0.80,0.90,0.80,0.05,0.10,0.05,0.70,0.70,0.05,0.80,0.05)
pi.greco[3,]=c(0.05,0.05,0.05,0.10,0.05,0.05,0.80,0.90,0.90,0.80,0.70,0.80,0.90,0.90)
for (i in 1:n)
for(j in 1:d)
 y[i,j]<-rbinom(1,1,prob=ifelse(sum(u[index[i],])==0,0.00000001,min(pi.greco[,j]^u[index[i],])))
#y is the 500x14 matrix of data

#RUNNING MANET
## Not run: 
##D data(concerts)
##D start=Sys.time()
##D crt<-manet(concerts,K=3,maxT=5000)
##D finish=Sys.time()
##D finish-start
##D #Time difference of 11.58112 mins
##D plot(crt)
##D summary(crt)
##D alloc<-summary(crt)$actor.allocations[,2]
##D adjustedRandIndex(index,alloc)
##D #0.8420733
##D classError(alloc,index)$errorRate
##D #0.07
## End(Not run)



