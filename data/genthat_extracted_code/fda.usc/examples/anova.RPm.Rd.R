library(fda.usc)


### Name: anova.RPm
### Title: Functional ANOVA with Random Project.
### Aliases: anova.RPm anova.RPm.boot summary.anova
### Keywords: anova

### ** Examples


# ex anova.hetero
data(phoneme)
names(phoneme)
data=as.data.frame(phoneme$learn[["data"]])
group=phoneme$classlearn
n=nrow(data)
group.rand=as.factor(sample(rep(1:3,len=n),n))
RP=c(2,5,15,30)

#ex 1: real factor and random factor
m03=data.frame(group,group.rand)
resul1=anova.RPm(data,~group+group.rand,m03,RP=c(5,30))
summary.anova(resul1)

#ex 2: real factor with special contrast
m0=data.frame(group)
cr5=contr.sum(5)   #each level vs last level
resul03c1=anova.RPm(data,~group,m0,contrast=list(group=cr5))
summary.anova(resul03c1)

#ex 3: random factor with special contrast
m0=data.frame(group.rand)
cr3=contr.sum(3)   #each level vs last level
resul03c1=anova.RPm(data,~group.rand,m0,contrast=list(group.rand=cr3))
summary.anova(resul03c1)



