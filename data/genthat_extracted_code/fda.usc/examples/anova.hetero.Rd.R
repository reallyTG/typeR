library(fda.usc)


### Name: anova.hetero
### Title: ANOVA for heteroscedastic data
### Aliases: anova.hetero
### Keywords: anova

### ** Examples


data(phoneme)
ind=1 # beetwen 1:150
fdataobj=data.frame(phoneme$learn[["data"]][,ind])
n=dim(fdataobj)[1]
group<-factor(phoneme$classlearn)

#ex 1: real factor and random factor
group.rand=as.factor(sample(rep(1:3,n),n))
f=data.frame(group,group.rand)
mm=data.frame(fdataobj,f)
colnames(mm)=c("value","group","group.rand")
out1=anova.hetero(object=mm[,-2],value~group.rand,pr=FALSE)
out2=anova.hetero(object=mm[,-3],value~group,pr=FALSE)
out1
out2

#ex 2: real factor, random factor and  special contrasts
cr5=contr.sum(5)  #each level vs last level
cr3=c(1,0,-1)			#first level vs last level
out.contrast=anova.hetero(object=mm[,-3],value~group,pr=FALSE,
contrast=list(group=cr5))
out.contrast
    


