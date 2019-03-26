library(gap)


### Name: ccsize
### Title: Power and sample size for case-cohort design
### Aliases: ccsize
### Keywords: misc

### ** Examples

# Table 1 of Cai & Zeng (2004).
outfile <- "table1.txt"
cat("n","pD","p1","theta","q","power\n",file=outfile,sep="\t")
alpha <- 0.05
n <- 1000
for(pD in c(0.10,0.05))
{
   for(p1 in c(0.3,0.5))
   {
      for(theta in c(0.5,1.0))
      {
         for(q in c(0.1,0.2))
         {
            power <- ccsize(n,q,pD,p1,alpha,theta)
            cat(n,"\t",pD,"\t",p1,"\t",theta,"\t",q,"\t",signif(power,3),"\n",
                file=outfile,append=TRUE)
         }
      }
   }
}
n <- 5000
for(pD in c(0.05,0.01))
{
   for(p1 in c(0.3,0.5))
   {
      for(theta in c(0.5,1.0))
      {
         for(q in c(0.01,0.02))
         {
            power <- ccsize(n,q,pD,p1,alpha,theta)
            cat(n,"\t",pD,"\t",p1,"\t",theta,"\t",q,"\t",signif(power,3),"\n",
                file=outfile,append=TRUE)
         }
      }
   }
}
table1<-read.table(outfile,header=TRUE,sep="\t")
unlink(outfile)
# ARIC study
outfile <- "aric.txt"
n <- 15792
pD <- 0.03
p1 <- 0.25
alpha <- 0.05
theta <- c(1.35,1.40,1.45)
beta1 <- 0.8
s_nb <- c(1463,722,468)
cat("n","pD","p1","hr","q","power","ssize\n",file=outfile,sep="\t")
for(i in 1:3)
{
  q <- s_nb[i]/n
  power <- ccsize(n,q,pD,p1,alpha,log(theta[i]))
  ssize <- ccsize(n,q,pD,p1,alpha,log(theta[i]),beta1)
  cat(n,"\t",pD,"\t",p1,"\t",theta[i],"\t",q,"\t",signif(power,3),"\t",ssize,"\n",
      file=outfile,append=TRUE)
}
aric<-read.table(outfile,header=TRUE,sep="\t")
unlink(outfile)
# EPIC study
outfile <- "epic.txt"
n <- 25000
alpha <- 0.00000005
power <- 0.8
s_pD <- c(0.3,0.2,0.1,0.05)
s_p1 <- seq(0.1,0.5,by=0.1)
s_hr <- seq(1.1,1.4,by=0.1)
cat("n","pD","p1","hr","alpha","ssize\n",file=outfile,sep="\t")
# direct calculation
for(pD in s_pD)
{
   for(p1 in s_p1)
   {
      for(hr in s_hr)
      {
         ssize <- ccsize(n,q,pD,p1,alpha,log(hr),power)
         if (ssize>0) cat(n,"\t",pD,"\t",p1,"\t",hr,"\t",alpha,"\t",ssize,"\n",
                          file=outfile,append=TRUE)
      }
   }
}
epic<-read.table(outfile,header=TRUE,sep="\t")
unlink(outfile)
# exhaustive search
outfile <- "search.txt"
s_q <- seq(0.01,0.5,by=0.01)
cat("n","pD","p1","hr","nq","alpha","power\n",file=outfile,sep="\t")
for(pD in s_pD)
{
   for(p1 in s_p1)
   {
      for(hr in s_hr)
      {
         for(q in s_q)
         {
            power <- ccsize(n,q,pD,p1,alpha,log(hr))
            cat(n,"\t",pD,"\t",p1,"\t",hr,"\t",q*n,"\t",alpha,"\t",power,"\n",
                file=outfile,append=TRUE)
         }
      }
   }
}
search<-read.table(outfile,header=TRUE,sep="\t")
unlink(outfile)



