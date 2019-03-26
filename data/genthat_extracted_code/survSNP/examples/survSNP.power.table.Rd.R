library(survSNP)


### Name: survSNP.power.table
### Title: Table for Asymptotic and Empirical Power
### Aliases: survSNP.power.table

### ** Examples

GRRs<-seq(1.5,2,by=0.25)
ns<-c(100,500,1000)
rafs<-c(0.3,0.5,0.7)
erates=c(0.5,0.7,0.9)
res<-survSNP.power.table(GRRs,ns,rafs,erates,pilm=0.5,lm=1,model="additive",
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





