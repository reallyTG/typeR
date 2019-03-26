library(ebGenotyping)


### Name: ecm
### Title: Genotyping and SNP Detection using Next Generation Sequencing
###   Data
### Aliases: ecm

### ** Examples

#---------generate simulation data-----------
#start:generate simulation data#
set.seed(2016)
m <- 100
m0 <- m*0.95
m1 <- m-m0
n <- 30
Q <- 0.8
z <- cbind(matrix(0,n,m0),matrix(rbinom(n*m1,1,Q),n,m1))
b <- which(z==1)
R <- 0.8 # proportion of homozygous SNP
w <- rbinom(length(which(z==1)),1,R)
# z are genotypes
z[b[which(w==0)]] <- 1
z[b[which(w==1)]] <- 2
mu <- rep(-3,m)# stands for no effect
delta <- rep(-3,n)# stands for no effect
er.p <- -abs(outer(delta,mu,"+"))
p <- rlogit(er.p)
p[which(z==1)] <- 1/2
p[which(z==2)] <- 1-p[which(z==2)]
cvg <- matrix(rbinom(m*n,50,0.5),n,m)
dat <- matrix(sapply(1:(m*n),function(i) rbinom(1,cvg[i],p[i])),n,m)
#end:generate simulation data-#
#-----genotyping and SNP detection----------------
res <- ecm(dat=dat,cvg=cvg)
mean(z!=res$geno.est)#genotyping error
#----------call SNP---------
#start:call snp#
# define a function to calculate power, typeI error and FDR.
cutsnp <- function(fdr,alpha,true){
wh <- (true!=0)
tp <- sum((wh)&(fdr<alpha));
tn <- sum((!wh)&(fdr>=alpha));
fp <- sum((!wh)&(fdr<alpha));
fn <- sum((wh)&(fdr>=alpha));
pw  <- tp/(tp+fn);
t1 <- fp/(fp+tn);
fdr <- fp/(fp+tp);
return(c(TP=tp,TN=tn,FP=fp,FN=fn,power=pw,typeI=t1,FDR=fdr))
}
cutsnp(fdr=res$post.probs$zRR,alpha=0.001,true=z)
cutsnp(fdr=res$post.probs$zRR,alpha=0.01,true=z)
cutsnp(fdr=res$post.probs$zRR,alpha=0.05,true=z)
#end:call snp#



