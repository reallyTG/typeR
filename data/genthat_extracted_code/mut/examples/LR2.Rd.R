library(mut)


### Name: LR2
### Title: Pairwise LR with Mutation
### Aliases: LR2

### ** Examples

library(expm)
library(Familias)
### The examples are from Egeland, Pinto and Amorim (2016)  
### (referred to as the 'paper' below)
### Example 2.1. 
### Consider a duo case and assume mutations are not possible.
p <- c(0.1,0.2,0.3,0.4)
M <- diag(c(1,1,1,1))
n.num <- c(2, 2, 2, 2)
n.den <- c(0, 0, 0, 0)
alpha <- c(1,1,1,1)/4
kappa.num <- c(0.25, 0.50, 0.25); kappa.den <- c(1,0,0); theta <- 0
# The next three LRs coincide with those found
# using exact formulae in the paper
LR2(c(1,2), c(3,4),  n.num, n.den, p, M, kappa.num, 
  kappa.den, alpha, theta)$LR
LR2(c(1,2), c(1,3),  n.num, n.den, p, M, kappa.num, 
  kappa.den, alpha, theta)$LR
LR2(c(1,2), c(1,2),  n.num, n.den, p, M, kappa.num, 
  kappa.den, alpha, theta)$LR
  
### Example 2.2 Identifying parent-child with mutation
### "A father and a son are missing ..."
p <- 0.2; R <- 0.005; k <- R/(2*p*(1-p))
M <- rbind(c(1-k*(1-p),k*(1-p)),c(k*p,1-k*p))
n.num <- c(0, 1, 1, 0); kappa.num <- c(0, 1, 0)
n.den <- c(0, 0, 0, 0); kappa.den <- c(1, 0, 0)
alpha <- c(0, 0.5, 0.5, 0)
theta <- 0.0
# Below values coincide, this is no longer true if
# M is made unbalanced or theta>0
LR2(c(1,1), c(2,2),  n.num, n.den, c(p, 1-p), M,
    kappa.num, kappa.den, alpha, theta)$LR
LR2(c(2,2), c(1,1),  n.num, n.den, c(p, 1-p), M,
    kappa.num, kappa.den, alpha, theta)$LR
    
### Example 2.3
library(Familias)
persons <- c("Child", "Alleged father")
sex <- c("male", "male")
ped1 <- FamiliasPedigree(id=persons, dadid=c("Alleged father",NA), 
  momid=c(NA,NA), sex=c("male", "male"))
ped2 <- FamiliasPedigree(id=persons, dadid=c(NA,NA), momid=c(NA,NA), 
  sex=c("male", "male"))
pedigrees <- list(ped1,ped2)
R =.01; theta = 0.02
locus1 <- FamiliasLocus(frequencies=c(0.25,0.25,0.25,0.25), 
  name="L1", allelenames=c("1","2","3","4"), 
  MutationRate = R, MutationModel="Proportional")
loci <- list(locus1)
datamatrix <- data.frame(locus1.1=c("3","1"), locus1.2=c("4","2"))
datamatrix <- data.frame(locus1.1=c("1","3"), locus1.2=c("2","4")) #Swapped, same result
rownames(datamatrix) <- persons
result <- FamiliasPosterior(pedigrees, loci, datamatrix, ref=2, kinship=theta)
result$LR[1]
(1+2*theta)/(1-theta)*(4/3)*R

### Example 3.1 of paper, double first cousin example
p <- 0.2; q <- 1-p; R <- 0.005; k <- R/(2*p*(1-p))
k4 <- 1-(1-k)^4
m <- 1-k4*(1-p)
kappa0 <- 9/16; kappa1 <- 6/16; kappa2 <- 1/16
kappa0+kappa1*m/p+kappa2*m^2/p^2
# LR=3.759526 as confirmed by familias.name/DFC.SNP.fam
# Alternatively using library familias.name/mut.zip
alpha <- c(0,0.5,0.5, 0)
n.num <- c(0,4, 4, 0); n.den <- c(0,0,0,0)
kappaDFC <- c(kappa0, kappa1, kappa2)
LR2(c(1,1),c(1,1),n.num, n.den, M=M, p=c(p,1-p), kappa.num=kappaDFC,
    alpha=alpha, theta=0, beta=0)$LR
# Four alleles
p <- c(0.1,0.2,0.3,0.4)
locus1 <- FamiliasLocus(frequencies=p, name="locus1",
                        allelenames= 1:length(p), MutationRate=R, MutationModel="Proportional")
M <- locus1$maleMutationMatrix
LR2(c(1,1), c(1,1),n.num, n.den, M=M, p=p, kappa.num=kappaDFC,
    alpha=alpha, theta=0, beta=0)
# LR=10.15314 as confirmed by http://familias.name/DFC.4.fam (takes a few minutes)
# With ten alleles, all allele freq 0.1, and  "Equal" mutation model
p <- rep(0.1,10)
locus1 <- FamiliasLocus(frequencies=p, name="locus1",
                        allelenames= 1:length(p), MutationRate=R, MutationModel="Equal")
M <- locus1$maleMutationMatrix
LR2(c(1,1), c(1,1),n.num, n.den, M=M, p=p, kappa.num=kappaDFC,
    alpha=alpha, theta=0, beta=0)
# LR=10.24266 as confirmed by http://familias.name/DFC.10.fam (takes a few minutes)

### Example 3.2 of paper
library(paramlink)
library(Familias)
R <- 0.005; p <- c(0.01, 0.2, 0.3, 0.49)
g1 <- c(1,2); g2 <- c(1,3)
an <- 1:length(p)
nn1 <- nn2 <- 3; x <- doubleCousins(nn1, nn2)
v <- 3
kappa.num <- c((2^{2*v}-1)^2, 2*(2^{2*v}-1),1)/16^v
alpha <- c(0.5, 0, 0, 0.5)
locus1 <- FamiliasLocus(frequencies=p, name="locus1",
                        allelenames= an, MutationRate=R, MutationModel="Proportional")
M <- locus1$maleMutationMatrix
n1 <- nn1+nn2+2; n2 <- nn1+nn2+2
n.num <- c(n1, 0, 0, n2)
n.den <- c(0, 0, 0, 0)
kappa.den <- c(1,0,0)
myLR <- LR2(g1, g2, n.num, n.den, p, M, kappa.num, kappa.den, alpha, beta=0)
myLR$LR
#Exact
k <- R/(1-sum(p^2))
k10 <- 1-(1-k)^n2
kappa.num[1]+
  kappa.num[2]*(p[3]*(k10*p[1]+(1-k10*(1-p[1]))) +
                  (p[1]*2*k10*p[3]))/(4*p[1]*p[3])  +
  kappa.num[3]*2*((1-k10*(1-p[1]))*k10*p[3]+k10^2*p[1]*p[3])/(4*p[1]*p[3])
  
### Example 3.3 HS or GP versus avuncular
p <- c(0.1, 0.2, 0.3, 0.4); R <-0.005
locus1 <- FamiliasLocus(frequencies=p, name="L1", allelenames=1:4,
                        femaleMutationRate = R, maleMutationRate =R,femaleMutationRange = 0.1,
                        maleMutationRange = 0.1,femaleMutationRate2 = 0, maleMutationRate2 = 0,
                        maleMutationModel="Proportional",femaleMutationModel="Proportional")
M <- locus1$maleMutationMatrix
kappa.num <- kappa.den <-c(0.5,0.5,0)
alpha <- c(1,0,0,0)
n1 <- c(2,0,0,0)
n2 <- c(3,0,0,0)
a <- 1; b<-2; c<-3; d<-4
g1 <- c(a,b); g2 <- c(c,d)
LR.1 <- LR2(g1, g2,n.num=n1, n.den=n2, p=p, M, kappa.num, 
            kappa.den, alpha, theta=0, beta=0)$LR
H <- 1-sum(p^2)
k <- R/H
k2 <- 1-(1-k)^2; k3 <- 1-(1-k)^3
# Case 1: a,b,c,d differ, no overlap in genotypes
LR.2 <- (1+k2)/(1+k3)
LR.1-LR.2#Equal
# Case 2 all a
g1 <- c(a,a); g2 <- c(a,a)
LR.1 <- LR2(g1, g2,n.num=n1, n.den=n2, p=p, M, kappa.num, kappa.den, alpha, theta=0)$LR
LR.2 <- (p[a]+1-k2*(1-p[a]))/(p[a]+1-k3*(1-p[a])) #all a
#Case 3 equal hetero
c <- 3; d <- 4
g1 <- c(c,d); g2 <- c(c,d)
LR.1 <- LR2(g1, g2,n.num=n1, n.den=n2, p=p, M, kappa.num, kappa.den, alpha, theta=0)$LR
num <- (4*p[c]*p[d]+p[d]*(1+k2*(2*p[c]-1))+p[c]*(1+k2*(2*p[d]-1)))
den <- (4*p[c]*p[d]+p[d]*(1+k3*(2*p[c]-1))+p[c]*(1+k3*(2*p[d]-1)))
LR.2 <- num/den
LR.1-LR.2

# Example QHFC Thompson p 22
p <- c(0.1, 0.9); R <- 0.005
kappa <-c(17,14,1)/32
alpha <- c(0.25,0.25,0.25,0.25)
n.num <- c(4,4,4,4); n.den <- c(0, 0, 0, 0)
locus1 <- FamiliasLocus(frequencies=p, name="locus1",
                        allelenames= 1:length(p), MutationRate=R, MutationModel="Proportional")
M <- locus1$maleMutationMatrix
LR2(c(1,2), c(1,1), n.num, n.den, M=M, p=p, kappa.num=kappa,
    alpha=alpha, theta=0, beta=0.5)
#=2.562366 See familias.name/QHFC.fam

# Example  Last line of Table 1 of old ms, to be balanced paper
data(NorwegianFrequencies)
d <- as.double(NorwegianFrequencies$D12S391)
names(d) <- 1:length(d) #21=16, 22=17 etct
n.num <- c(4,0,0,2); n.den <- c(0, 0, 0, 0)
alpha <- c(1/8,0,0, 7/8);kappa.num <- c(7/16,8/16,1/16)
line <-NULL
R <-0
locus1 <- FamiliasLocus(frequencies=d, name="locus1",
                        allelenames=1:length(d), MutationRate=R, MutationModel="Proportional")
M <- locus1$maleMutationMatrix
line <- c(line, LR2(c(16,17), c(18,19), n.num,  n.den,
                    d, M, kappa.num, alpha=alpha)$numerator)
R <-0.0021
locus1 <- FamiliasLocus(frequencies=d, name="locus1",
                        allelenames=1:length(d), MutationRate=R, MutationModel="Proportional")
M <- locus1$maleMutationMatrix
line <- c(line,LR2(c(16,17),c(18,19),n.num, n.den ,d,M,kappa.num, alpha=alpha)$numerator)
locus1 <- FamiliasLocus(frequencies=d, name="locus1",
                        allelenames=1:length(d), MutationRate=R, MutationModel="Equal")
M <- locus1$maleMutationMatrix
line <- c(line,LR2(c(16,17),c(18,19), n.num, n.den, d, M, kappa.num, alpha=alpha)$numerator)
line <- c(line,LR2(c(18,19),c(16,17), n.den, n.den, d, M, kappa.num, alpha=alpha)$numerator)
names(line) <- paste("col",1:4,sep="")
p <- d[c(16,17,18,19)]
(7/16)*4*prod(p)# First column

#Silent, mutation and kinship
p <- c(0.2, 0.75, 0.05); R <- 0.005
locus1 <- FamiliasLocus(frequencies=p, name="L1",
                        allelenames=c("1","2",  "silent"),
                        femaleMutationRate = R, maleMutationRate =R,femaleMutationRange = 0.1,
                        maleMutationRange = 0.1,femaleMutationRate2 = 0, maleMutationRate2 = 0,
                        maleMutationModel="Proportional",
                        femaleMutationModel="Proportional")
M <- locus1$maleMutationMatrix
persons <- c("AF", "CH")
sex <- c("male", "male")
H1 <- FamiliasPedigree(dadid=c(NA, "AF"), momid= c(NA,NA),
                       sex=sex, id=persons)
H2 <- FamiliasPedigree(dadid=c(NA, NA), momid= c(NA,NA),
                       sex=sex, id=persons)
dm <- rbind(c(1,1),
            c(2,2))
rownames(dm) <- persons
theta <- 0.03
alpha <- c(0.5, 0.5, 0, 0)
n.num <- c(1, 1, 0, 0)
n.den <- c(0, 0, 0, 0)
pedigrees <- list(H1, H2)
LRfam <- FamiliasPosterior(pedigrees, locus1, dm, ref=2,
                           kinship = theta)$LRperMarker[1]
LR <- LR2(c(1,1), c(2,2), n.num,n.den, p, M, c(0,1,0), c(1,0,0),
          alpha, theta, silent=TRUE)$LR #=0.1973758 as for Familias

# Example in Section 2.1.2. Duo with mutation and theta
R <- 0.01
theta <- 0.02
LR <- 4*(R/3)*(1+2*theta)/(1-theta) #Exact LR

g1 <- c(1,2); g2 <- c(3,4)
n.num <- c(1,0, 1,0); n.den <- c(0, 0, 0, 0)
p <- c(1, 1, 1, 1)/4
kappa.num <- c(0, 1, 0)
kappa.den <- c(1, 0, 0)
alpha <- c(0.5,0.0,0.5,0)
theta <- 0.02
silent <- 0
locus1 <- FamiliasLocus(frequencies=p, name="locus1",
                        allelenames= 1:4, MutationRate=R, 
                        MutationModel="Proportional")
M <- locus1$maleMutationMatrix
LR2(g1, g2, n.num, n.den, p, M, kappa.num, kappa.den, alpha, theta, silent)



