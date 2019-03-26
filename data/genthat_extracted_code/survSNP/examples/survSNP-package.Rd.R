library(survSNP)


### Name: survSNP-package
### Title: Power Calculations for SNP Studies with Censored Outcomes
### Aliases: survSNP-package survSNP

### ** Examples

# See vignette for examples including details on the example
# considered below

results<-sim.snp.expsurv.power(GHR=1.25, B=0, n=500, raf=0.1, erate=0.75, pilm=0.5, 
                               lm=1, model="additive", test="additive", alpha=0.05)
results[,c("n","erate","alpha","pow0")]


GHRs<-seq(1.05,1.5,by=0.05)
ns<-c(100,500,700)
rafs<-c(0.1,0.3,0.5)
erates<-c(0.5,0.7,0.9)
res<-survSNP.power.table(GHRs,ns,rafs,erates,pilm=0.5,lm=1,model="additive",
                         test="additive",alpha=0.05)

# Create key for illustration
KEY=paste("q=",levels(factor(res$raf)),sep="")
KEY<-list(lines=list(col=1:length(KEY),lty=1:length(KEY)),
          text=list(labels=paste("q=",levels(factor(res$raf)),sep="")),
          column=3)


# Illustrate Power
print(xyplot(pow0~GHR|factor(erate)*factor(n),group=factor(raf),
             data=res,type="l",lty=KEY$lines$lty,col=KEY$lines$col,
             key=KEY,
             xlab="Genotype Hazard Ratio",ylab="Power"))

# Illustrate Power (restricted to n=100)

print(xyplot(pow0~GHR|factor(erate),group=factor(raf),
             data=subset(res,n==ns[1]),
             type="l",lty=KEY$lines$lty,col=KEY$lines$col,
             key=KEY,
             xlab="Genotype Hazard Ratio",ylab="Power",
             sub=paste("n=",ns[1],", alpha=",round(unique(res$alpha),2))))




