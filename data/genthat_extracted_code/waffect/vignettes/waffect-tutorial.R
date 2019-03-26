### R code from vignette source 'waffect-tutorial.Rnw'

###################################################
### code chunk number 1: waffect-tutorial.Rnw:13-15
###################################################
options(keep.source = TRUE, width = 60)
foo <- packageDescription("waffect")


###################################################
### code chunk number 2: waffect-tutorial.Rnw:49-53
###################################################
library(waffect); set.seed(42)

pi <- c(0.5,0.2,0.9,0.3,0.1)
waffect(prob=pi, count=c(2,3), label=c(1,0))


###################################################
### code chunk number 3: waffect-tutorial.Rnw:58-59
###################################################
waffect(prob=pi, count=c(2,3), label=c(1,0))


###################################################
### code chunk number 4: waffect-tutorial.Rnw:64-65
###################################################
waffect(prob=pi, count=2, label=c(1,0))


###################################################
### code chunk number 5: waffect-tutorial.Rnw:70-71
###################################################
waffect(prob=pi, count=c(2,3))


###################################################
### code chunk number 6: waffect-tutorial.Rnw:76-77
###################################################
waffect(prob=pi, count=c(2,3), label=c("case", "control"))


###################################################
### code chunk number 7: waffect-tutorial.Rnw:82-83
###################################################
waffect(prob=pi, count=c(2,3), label=c(2,1))


###################################################
### code chunk number 8: waffect-tutorial.Rnw:90-91
###################################################
waffect(count=c(7,9), label=c(1,0))


###################################################
### code chunk number 9: waffect-tutorial.Rnw:96-97
###################################################
obs <- c(1,1,0,0,0,1,0,1,1,0)


###################################################
### code chunk number 10: waffect-tutorial.Rnw:101-102
###################################################
sample(obs)


###################################################
### code chunk number 11: waffect-tutorial.Rnw:127-134
###################################################
pi1 = c(0.5,0.4,0.1)
pi2 = c(0.3,0.5,0.2)
pi3 = c(0.1,0.1,0.8)
pi4 = c(0.2,0.6,0.2)
pi5 = c(0.1,0.7,0.2)
pi = cbind(pi1,pi2,pi3,pi4,pi5)
waffect(prob = pi, count = c(2,2,1),label=1:3)


###################################################
### code chunk number 12: waffect-tutorial.Rnw:160-165
###################################################
library(waffect)
data(map)
write.table(map,file = "data.map", row.names=FALSE, col.names = FALSE)
data(ped)
write.table(ped,file = "data.ped", row.names=FALSE, col.names = FALSE)


###################################################
### code chunk number 13: waffect-tutorial.Rnw:192-195
###################################################
ped <- read.table("data.ped")
x <- ped[,c(6+500*2-1,6+500*2)]
length(which( x == "T")) < length(which( x == "A"))


###################################################
### code chunk number 14: waffect-tutorial.Rnw:200-207
###################################################
ad <- 0.5 
RR <- rep(NA, 100)
RR[x[,1] == "A" & x[,1] == "A"] <- 1.0 + ad * 0
RR[x[,1] != x[,2]] <- 1.0 + ad * 1
RR[x[,1] == "T" & x[,2] == "T"] <- 1.0 + ad * 2
f0 <- 0.1 
pi = f0*RR


###################################################
### code chunk number 15: waffect-tutorial.Rnw:212-216
###################################################
Nsim <- 200
pheno_H1 <- matrix(NA, nrow = 100, ncol = Nsim)
for(i in 1:Nsim)
	pheno_H1[,i] <- waffect(prob = pi, count=40, label=c(2, 1))


###################################################
### code chunk number 16: waffect-tutorial.Rnw:221-223
###################################################
pheno_H1 <- cbind(1:100,1:100,pheno_H1)	
write.table(pheno_H1, file = "pheno_H1.txt", row.names = FALSE, col.names = FALSE)


###################################################
### code chunk number 17: waffect-tutorial.Rnw:227-233
###################################################
pheno_H0 <- matrix(NA, nrow = 100, ncol = Nsim)
for(i in 1:Nsim)
	pheno_H0[,i] <- waffect(count = c(40,60), label = c(2,1))

pheno_H0 <- cbind(1:100,1:100,pheno_H0)
write.table(pheno_H0, file = "pheno_H0.txt", row.names = FALSE, col.names = FALSE)


###################################################
### code chunk number 18: waffect-tutorial.Rnw:244-245
###################################################
#system("mkdir H1_signal H0_signal")


###################################################
### code chunk number 19: waffect-tutorial.Rnw:249-251
###################################################
#system("plink --file data --model --pheno pheno_H1.txt --all-pheno --out H1_signal/H1")
#system("plink --file data --model --pheno pheno_H0.txt --all-pheno --out H0_signal/H0") 


###################################################
### code chunk number 20: waffect-tutorial.Rnw:277-292
###################################################
#p1_H1 <- rep(NA,Nsim)
#for(i in 1:Nsim){
#	FileIn <- paste("H1_signal/H1.P", i , ".model", sep="")
#	aux <- read.table(FileIn, header = TRUE)
#	aux <- aux[which(aux$TEST == "TREND"),]
#	p1_H1[i] <- max(-log10(na.omit(aux$P)))
#}

#p1_H0 <- rep(NA,Nsim)
#for(i in 1:Nsim){
#	FileIn <- paste("H0_signal/H0.P", i , ".model", sep="")
#	aux <- read.table(FileIn, header = TRUE)
#	aux <- aux[which(aux$TEST == 'TREND'),]
#	p1_H0[i] <- max(-log10(na.omit(aux$P)))
#}


###################################################
### code chunk number 21: waffect-tutorial.Rnw:298-302
###################################################
data(p1_H1)
p1_H1 <- p1_H1$signal
data(p1_H0)
p1_H0 <- p1_H0$signal


###################################################
### code chunk number 22: ROCS1
###################################################
library(pROC)
roc(controls = p1_H0, cases = p1_H1, ci=TRUE, plot = TRUE)


###################################################
### code chunk number 23: waffect-tutorial.Rnw:319-320
###################################################
library(pROC)
roc(controls = p1_H0, cases = p1_H1, ci=TRUE, plot = TRUE)


###################################################
### code chunk number 24: ROCS2
###################################################
#region <- 498:502 

#p2_H0 <- rep(NA,Nsim)
#for(i in 1:Nsim){
#	FileIn <- paste("H0_signal/H0.P", i, ".model", sep = "")
#	aux <- read.table(FileIn, header = TRUE)
#	aux <- aux[which(aux$TEST == "TREND"),]
#	aux <- aux[region,]
#	p2_H0[i] <- max(-log10(na.omit(aux$P)))
#}

#p2_H1 <- rep(NA,Nsim)
#for(i in 1:Nsim){
#	FileIn <- paste("H1_signal/H1.P", i, ".model", sep="")
#	aux <- read.table(FileIn, header=TRUE)
#	aux <- aux[which(aux$TEST == "TREND"),]
#	aux <- aux[region,]
#	p2_H1[i] <- max(-log10(na.omit(aux$P)))
#}


###################################################
### code chunk number 25: waffect-tutorial.Rnw:362-366
###################################################
data(p2_H1)
p2_H1 <- p2_H1$signal
data(p2_H0)
p2_H0 <- p2_H0$signal


###################################################
### code chunk number 26: ROCS2
###################################################
roc(controls = p2_H0, cases = p2_H1, plot = TRUE, ci=TRUE)


###################################################
### code chunk number 27: waffect-tutorial.Rnw:380-381
###################################################
roc(controls = p2_H0, cases = p2_H1, plot = TRUE, ci=TRUE)


