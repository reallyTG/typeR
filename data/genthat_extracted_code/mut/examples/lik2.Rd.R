library(mut)


### Name: lik2
### Title: Pairwise likelihood with mutation
### Aliases: lik2

### ** Examples

library(expm)
library(Familias)
# Example 1. Paternity case. Silent allele, mutation
p <- c(0.2, 0.75, 0.05); R <- 0.005
locus1 <- FamiliasLocus(frequencies=p, name="L1", allelenames=c("1","2",  "silent"), 
	femaleMutationRate = R, maleMutationRate =R,femaleMutationRange = 0.1, 
	maleMutationRange = 0.1,femaleMutationRate2 = 0, maleMutationRate2 = 0, 
	maleMutationModel="Proportional", femaleMutationModel="Proportional")
M <- locus1$maleMutationMatrix
theta <- 0.03
n <- c(0, 1, 1, 0); kappa.num <- c(0, 1, 0); kappa.den <- c(1, 0, 0);alpha <- c(0, 0.5, 0.5, 0)
t1 <- lik2(c(1,1), c(2,2), n, p, M, kappa.num, alpha, theta)
t2 <- lik2(c(1,3), c(2,2), n, p, M, kappa.num, alpha, theta)
t3 <- lik2(c(1,1), c(2,3), n, p, M, kappa.num, alpha, theta)
t4 <- lik2(c(1,3), c(2,3), n, p, M, kappa.num, alpha, theta)
u1 <- lik2(c(1,1), c(2,2), n, p, M, kappa.den, alpha, theta)
u2 <- lik2(c(1,3), c(2,2), n, p, M, kappa.den, alpha, theta)
u3 <- lik2(c(1,1), c(2,3), n, p, M, kappa.den, alpha, theta)
u4 <- lik2(c(1,3), c(2,3), n, p, M, kappa.den, alpha, theta)
num <- t1 + t2 + t3 + t4
den <- u1 + u2 + u3 + u4
LR1 <- num/den
# Below LR is checked using Familias
persons <- c("AF", "CH")
sex <- c("male", "male")
#Define the alternative pedigrees
ped1 <- FamiliasPedigree(id=persons, dadid=c(NA,"AF"),
momid=c(NA,NA), sex=c("male", "male"))
ped2 <- FamiliasPedigree(id=persons, dadid=c(NA,NA), 
momid=c(NA,NA), sex=c("male", "male"))
pedigrees <- list(ped1,ped2)
datamatrix <- data.frame(locus1.1=c(1,2), locus1.2=c(1,2))
rownames(datamatrix) <- persons
result <- FamiliasPosterior(pedigrees, locus1, datamatrix, ref=2, kinship = theta)
LR2 <- result$LR[1]
stopifnot(abs(LR1 - LR2) <1e-15)
###
library(Familias)
test <- function(a, b, c, d, R, model="Proportional",
	p=c(0.1,0.2,0.3,0.3,0.1), theta=0){
anames <- 1:length(p)
datamatrix <- cbind(c(NA,NA,a,c,NA,NA),c(NA,NA,b,d,NA,NA))
persons <- c("FA","MO", "B1", "B2","EM","EF")
rownames(datamatrix) <- persons
seks <- c("male", "female", "male", "male","male","female")
ped1 <- FamiliasPedigree(id=persons, dadid=c(NA, NA,"FA","FA",NA, NA), 
        momid=c(NA, NA,NA,NA,NA, NA), sex = seks)
ped2 <- FamiliasPedigree(id=persons, dadid=c(NA, NA,"FA","FA",NA, NA), 
        momid=c(NA, NA,"MO","MO",NA, NA), sex =seks)
ped3 <- FamiliasPedigree(id=persons, dadid=c(NA, NA,"B2",NA,NA, NA), 
        momid=c(NA, NA,NA,NA,NA, NA), sex =seks)
ped4 <- FamiliasPedigree(id=persons, dadid=c(NA, NA,NA,NA,NA, NA), 
        momid=c(NA, NA,NA,NA,NA, NA), sex =seks)
ped5 <- FamiliasPedigree(id=persons, dadid=c("B1", NA,NA,"FA",NA, NA), 
        momid=c(NA, NA,NA,NA,NA, NA), sex =seks)
ped6 <- FamiliasPedigree(id=persons, dadid=c(NA, "B1",NA,"FA",NA, NA), 
        momid=c("MO", NA,NA,NA,NA, NA), sex =seks)
ped7 <- FamiliasPedigree(id=persons, dadid=c("EM", "EM","FA",NA,NA, NA), 
        momid=c("EF", "EF",NA,"MO",NA, NA), sex =seks)
ped8 <- FamiliasPedigree(id=persons, dadid=c("EM", "B1",NA,"FA",NA, NA), 
        momid=c(NA, NA,NA,NA,"MO", NA), sex =seks)
ped9 <- FamiliasPedigree(id=persons, dadid=c(NA, NA,"FA","EM","FA", NA), 
        momid=c(NA, NA,"MO",NA,"MO", NA), sex =seks)
ped10 <- FamiliasPedigree(id=persons, dadid=c(NA, NA,"FA","EM",NA, NA), 
         momid=c("EF", NA,"MO","MO","EF", NA), sex =seks)
peds <- list(HS=ped1,FS=ped2, PO=ped3, UNR=ped4,GP=ped5, GR=ped6, 
          CO=ped7,GGR=ped8,AVU=ped9,diff=ped10)
locus1 <- FamiliasLocus(frequencies=p, name="locus1", 
          allelenames= anames, MutationRate=R, MutationModel=model)
res <- FamiliasPosterior(peds, locus1, datamatrix)
M <- locus1$maleMutationMatrix
g1 <- c(a,b); g2 <- c(c,d)
l1 <- lik2(g1, g2, n=c(1,0,0,0),p,M,
		kappa=c(0.5,0.5,0), alpha=c(1,0,0,0), theta)
l2 <- lik2(g1, g2, n=c(1,1,1,1), p, M, 
		kappa=c(0.25,0.5,0.25), alpha=c(1,1,1,1)/4, theta)
l3 <- lik2(g1, g2, n=c(1,1, 0,0),p, M,
		kappa=c(0,1,0.0), alpha=c(0.5, 0.5, 0, 0), theta)
l4 <- lik2(g1, g2, n=c(0,0,0,0), p, M,
		kappa=c(1,0,0.0), alpha=c(1,1,1,1)/4, theta)
l5 <- lik2(g1, g2, n=c(1,1,0,0), p, M,
		kappa=c(0.5, 0.5,0.0), alpha=c(0.5, 0.5, 0, 0), theta)
l6 <- lik2(g1, g2, n=c(2,2,0,0), p, M,
		kappa=c(0.75, 0.25,0.0), alpha=c(0.5, 0.5, 0, 0), theta) 
l7 <- lik2(g1, g2, n=c(0,4,0,0), p, M,
		kappa=c(0.75, 0.25,0.0), alpha=c(0, 1, 0, 0), theta)
l8 <- lik2(g1, g2, n=c(3,3,0,0), p, M,
		kappa=c(7/8, 1/8,0.0), alpha=c(0.5, 0.5, 0, 0), theta) 
l9 <- lik2(g1, g2, n=c(3,3,0,0), p, M,
		kappa=c(0.5, 0.5,0.0), alpha=c(0.5, 0.5, 0, 0), theta) 
l10 <- lik2(g1, g2, n=c(4,0,0,0), p, M,
		kappa=c(7, 8, 1)/16, alpha=c(1,0, 0, 0), theta) 
fam <- res$likelihoods
exact <- c(l1,l2,l3,l4,l5,l6,l7,l8,l9,l10)
z <- abs(res$likelihoods-exact)
check <- all(z< 1e-10)
res <- cbind(fam,exact)
colnames(res) <- c("Familias","Exact")
rownames(res) <- c("HS","FS","PO", "UNR","GP","GGP","CO","GGGP", "UNC","HS+")
list(res, check=check)
}

data(NorwegianFrequencies)
d <- NorwegianFrequencies$D12S391
names(d) <- 1:length(d) #21=16, 22=17 etct
foo3 <- test(16,17,18,19,R=0.00,"Proportional", p=as.double(d))
foo3 <- foo3[[1]]
foo4 <- test(16,17,18,19,R=0.0021,"Proportional", p=as.double(d))
foo4 <- foo4[[1]]
foo5 <- test(16,17,18,19,R=0.0021,"Equal", p=as.double(d))
foo5 <- foo5[[1]]
foo6 <- test(18,19,16,17,R=0.0021,"Equal", p=as.double(d))
foo6 <- foo6[[1]]
foo <- cbind(foo3,foo4,foo5,foo6)
foo <- foo[,c(1,3,5,7)]
kappa <- c("(0.5,0.5,0)","(0.25,0.5,0.25)","(0,1,0)","1,0,0)",
           "(0.5,0.5,0)","(0.75,0.25,0)","(0.75,0.25,0)","(7/8,1/8,0)","(0.5,0.5,0)",
           "(7/16,8/16,1/16)")
Table1 <- data.frame(kappa,foo)
colnames(Table1) <- c("kappa","R=0","R=0.0021","R=0.0021(Eq)","Swapped")
Table1

# Example  First example of paper
foo1 <- test(1,1,2,2,R=0.005, model="Equal",p=c(0.1,0.9) )[[1]][3,1]
foo2 <- test(2,2,1,1,R=0.005, model="Equal",p=c(0.1,0.9) )[[1]][3,1]
foo1/foo2 #=9, i.e., no 1
foo1 <- test(1,1,2,2,R=0.005, model="Proportional",p=c(0.1,0.9) )[[1]][3,1]
foo2 <- test(2,2,1,1,R=0.005, model="Proportional",p=c(0.1,0.9) )[[1]][3,1]
foo1/foo2 # =1
#LR with general mutation matrix using Familias
library(Familias)
id <- c("I", "II")
I.II <- FamiliasPedigree(id, c(NA, "I"), c(NA, NA), c("male", "male"))
II.I <- FamiliasPedigree(id, c(NA, NA), c(NA, NA), c("male", "male"))
pedigrees <- list( I.II = I.II, II.I = II.I)
m12 <- 1/100; m21 <- 3/100
M <- rbind(c(1-m12,m12),c(m21,1-m21))
p1 <- m21/(m12+m21);p2 <- m12/(m12+m21); p <- c(p1,1-p1)
anames <- 1:length(p)
locus1 <-FamiliasLocus(frequencies = p,"locus1",  
                      allelenames = anames, 
		          MutationModel="Custom", MutationMatrix=M)
locus2 <-FamiliasLocus(frequencies = p,"locus2",  
                      allelenames = anames, 
		          MutationModel="Custom", MutationMatrix=M)
datamatrix <- data.frame(locus1.1=c(1,2), locus1.2=c(1,2), locus2.1=c(2,1),locus2.2=c(2,1))
rownames(datamatrix) <- c("I","II")
myloci <- list(locus1,locus2)
LRs <- FamiliasPosterior(pedigrees,myloci, datamatrix,ref=2)$LRperMarker[,1]
#Both above: 
m12+m21
#Example 3 Stationarity not enough
library(Familias)
id <- c("I", "II")
I.II <- FamiliasPedigree(id, c(NA, "I"), c(NA, NA), c("male", "male"))
II.I <- FamiliasPedigree(id, c(NA, NA), c(NA, NA), c("male", "male"))
pedigrees <- list( I.II = I.II, II.I = II.I)
R <- 0.1
M <- rbind(c(1-2*R,3*R/2,R/2),c(R/2,1-R,R/2),c(R/2,R/2,1-R))
p <- c(3,7,5)/15
anames <- 1:length(p)
locus1 <-FamiliasLocus(frequencies = p,"locus1",  
                      allelenames = anames, 
		          MutationModel="Custom", MutationMatrix=M)
locus2 <-FamiliasLocus(frequencies = p,"locus2",  
                      allelenames = anames, 
		          MutationModel="Custom", MutationMatrix=M)
datamatrix <- data.frame(locus1.1=c(1,2), locus1.2=c(1,2), locus2.1=c(2,1),locus2.2=c(2,1))
rownames(datamatrix) <- c("I","II")
myloci <- list(locus1,locus2)
result1 <- FamiliasPosterior(pedigrees,myloci, datamatrix,ref=2)
result1$LRperMarker
result1$LRperMarker[1]-45*R/14
result1$LRperMarker[2]-35*R/14
for (i in 1:10000) p <- p
p

# Example 3
# Exact calculation with SNP-s for an example of the paper
example2 <- function(p=0.4,R=0.005){
k <- R/(2*p*(1-p))
m11 <- 1-k*(1-p)
m22 <- 1- k*p
HS <- 0.5*p^4+0.5*p^3*(m11^2+k^2*p*(1-p))
UNC <- 0.5*p^4+0.5*p^3*(m11^3+2*k^2*p*(1-p)*m11+k^2*(1-p)*p)
GGP <- 0.75*p^4+0.25*p^3*(m11^3+2*k^2*p*(1-p)*m11+k^2*(1-p)*p)
list(HS.GP=HS,UNC=UNC, GGP=GGP)
}
p <- 0.4; R <- 0.005
example2(p,R)
test(1,1,1,1,R=R,"Proportional", p=c(p,1-p))[[1]][c(1,5,9,6),1]

#Example 4
data(NorwegianFrequencies)
p<-as.double(NorwegianFrequencies$D12S391)
k <- 0.0021/sum(p*(1-p))

#Example 5
#Same mother, father brothers
rm(list=ls())
a <- 1;b <- 2; c <- 1;d <- 3
persons <- c("FA","MO", "B1", "B2","EM","EF","EM2")
seks <- c("male", "female", "male", "male","male","female","male")
R <- 0.0021; model <- "Proportional"; p <- c(0.1,0.2,0.3,0.3,0.1)
anames <- 1:length(p)
ped11 <- FamiliasPedigree(id=persons, dadid=c("EM2", NA,"FA","EM","EM2", NA,NA), 
        momid=c("EF", NA,"MO","MO","EF", NA, NA), sex =seks)
datamatrix <- cbind(c(NA,NA,a,c,NA,NA,NA),c(NA,NA,b,d,NA,NA,NA))
rownames(datamatrix) <- persons
locus1 <- FamiliasLocus(frequencies=p, name="locus1", 
             allelenames= anames, MutationRate=R, MutationModel=model)
res <- FamiliasPosterior(ped11, locus1, datamatrix)
M <- locus1$maleMutationMatrix
l11 <- lik2(c(a,b),c(c,d), n = c(4,0,0,2), p,M,
		kappa=c(3/8,4/8,1/8), alpha=c(1/4,0,0,3/4), theta=0)
 c(res$likelihoodsPerSystem,l11)




