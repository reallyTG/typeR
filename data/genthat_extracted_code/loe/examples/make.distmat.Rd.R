library(loe)


### Name: make.distmat
### Title: Euclidean distance matrix computation
### Aliases: make.distmat

### ** Examples

#Create a toy data
x <- seq(-5,5,by=1)
y <- seq(1,6,by=1)
hx1 <- seq(-3.5,-1.5,by=0.5)
hx2 <- seq(1.5,3.5,by=0.5)
hy <- seq(2.5,4.5,by=0.5)
D1 <- matrix(0,66,2)
for(i in 1:11){
	for(j in 1:6){
		D1[i+11*(j-1),] <- c(x[i],y[j])
	}
}
D2n <- matrix(0,25,2)
D2p <- matrix(0,25,2)
for(i in 1:5){
	for(j in 1:5){
		D2n[i+5*(j-1),] <- c(hx1[i],hy[j])
		D2p[i+5*(j-1),] <- c(hx2[i],hy[j])
	}
}
D2n <- D2n[-c(7,9,17,19),]
D2p <- D2p[-c(7,9,17,19),]
Data <- rbind(D1,D2n,D2p)

#Creating a k-NN graph based on Data
DM <- make.distmat(Data)



