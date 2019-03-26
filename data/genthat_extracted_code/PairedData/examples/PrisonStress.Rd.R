library(PairedData)


### Name: PrisonStress
### Title: Stress in prison
### Aliases: PrisonStress
### Keywords: datasets

### ** Examples

data(PrisonStress)

# The two groups are not randomized! 
# The control group is less stressed before the experiment
with(PrisonStress,boxplot(PSSbefore~Group,ylab="Stress at the eginning of the study"))

# But more stressed at the end!
with(PrisonStress,boxplot(PSSafter~Group,ylab="22 weeks later"))

# So the effects of physical training seems promising
with(PrisonStress,plot(paired(PSSbefore,PSSafter),groups=Group,type="BA",facet=FALSE))

# Testing using gain scores analysis
difference<-PrisonStress$PSSafter-PrisonStress$PSSbefore
t.test(difference~PrisonStress$Group,var.equal=TRUE)

# Testing using ANCOVA
lmJail<-lm(PSSafter~PSSbefore*Group,data=PrisonStress)
anova(lmJail)

# Testing using repeated measures ANOVA
PSS<-c(PrisonStress$PSSbefore,PrisonStress$PSSafter)
Time<-factor(rep(c("Before","After"),c(26,26)))
Subject<-rep(PrisonStress$Subject,2)
Condition<-rep(PrisonStress$Group,2)
aovJail<-aov(PSS~Condition*Time+Error(Subject))
summary(aovJail)



