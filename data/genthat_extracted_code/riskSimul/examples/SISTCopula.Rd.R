library(riskSimul)


### Name: SISTCopula
### Title: Efficient tail-loss probability and conditional excess
###   estimation for t-copula model
### Aliases: SISTCopula NVTCopula new.portfobj
### Keywords: copula

### ** Examples

R<- matrix(
c(1, 	0.554, 	0.632, 	0.419, 	0.400, 
  0.554,1, 		0.495, 	0.540, 	0.479,
  0.632,0.495, 	1, 		0.426, 	0.445,
  0.419,0.540, 	0.426, 	1, 		0.443,
  0.400,0.479, 	0.445, 	0.443, 	1),ncol=5)
  
pmg<- matrix(NA,ncol=5,nrow=5)  
colnames(pmg) <- c("lambda","alpha","beta","delta","mu")
pmg[1,] <- c(-0.602828, 8.52771, -0.533197, 0.014492, -0.000091)
pmg[2,] <- c(-1.331923, 2.72759, -2.573416, 0.019891, 0.001388)
pmg[3,] <- c(-1.602705, 3.26482, 1.456542, 0.035139, -0.001662)
pmg[4,] <- c(-1.131092, 15.13351, -1.722396, 0.014771, 0.001304)
pmg[5,] <- c(-0.955118, 31.14005, 0.896576, 0.015362, -0.000238)
 
portfo <- new.portfobj(nu=8.195,R=R,typemg="GH",parmg=pmg,c=rep(1,5),w=rep(0.2,5))

res1<- SISTCopula(n=10^4,npilot=c(10^3,3*10^3),portfobj=portfo,threshold=c(0.97,0.96,0.95,0.94),
                  stratasize=c(22,22),CEopt=FALSE,beta=0.75,mintype=0)
 res1
 SISTCopula(n=10^4,npilot=c(10^3,3*10^3),portfobj=portfo,threshold=0.94,
            stratasize=c(22,22),CEopt=FALSE)

 NVTCopula(n=10^4,portfobj=portfo,threshold=c(0.97,0.96,0.95,0.94))
 NVTCopula(n=10^4,portfobj=portfo,threshold=0.94)

########
# example with t-marginals

R<- matrix(
c(1, 	0.551, 	0.636, 	0.421, 	0.398, 
  0.551,1, 	0.496, 	0.540, 	0.477,
  0.636,0.496, 	1, 	0.428, 	0.447,
  0.421,0.540, 	0.428, 	1, 	0.444,
  0.398,0.477, 	0.447, 	0.444, 	1),ncol=5)
   

pmg<- matrix(NA,ncol=3,nrow=5)  
colnames(pmg) <- c("mu","sigma","nu")
pmg[1,] <- c(-0.000258, 0.013769, 1.78)
pmg[2,] <- c(0.000794, 0.012166, 2.64)
pmg[3,] <- c(-0.000837, 0.019616, 3.25)
pmg[4,] <- c(0.001041, 0.009882, 2.67)
pmg[5,] <- c(-0.000104, 0.010812, 3.10)

portfo <- new.portfobj(nu=7.525,R=R,typemg="t",parmg=pmg,c=rep(1,5),w=rep(0.2,5))

res1<- SISTCopula(n=10^4,npilot=c(10^3,3*10^3),portfobj=portfo,threshold=c(0.97,0.96,0.95,0.94),
                  stratasize=c(22,22),CEopt=FALSE,beta=0.75,mintype=0)
res1
SISTCopula(n=10^4,npilot=c(10^3,3000),portfobj=portfo,threshold=0.94,stratasize=c(22,22))

NVTCopula(n=10^4,portfobj=portfo,threshold=c(0.97,0.96,0.95,0.94))
NVTCopula(n=10^4,portfobj=portfo,threshold=0.94)



