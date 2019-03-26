library(riskSimul)


### Name: riskSimul
### Title: Risk Quantification for Stock Portfolios under the T-Copula
###   Model
### Aliases: riskSimul

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



