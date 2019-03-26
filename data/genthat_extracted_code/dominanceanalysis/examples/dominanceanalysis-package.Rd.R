library(dominanceanalysis)


### Name: dominanceanalysis-package
### Title: Dominance analysis for general, generalized and mixed linear
###   models
### Aliases: dominanceanalysis-package dominanceanalysis

### ** Examples

# Basic dominance analysis

data(longley)
lm.1<-lm(Employed~.,longley)
da<-dominanceAnalysis(lm.1)
print(da)
summary(da)

# Dominance analysis for HLM

library(lme4)
x1<-rnorm(1000)
x2<-rnorm(1000)
g<-gl(10,100)
g.x<-rnorm(10)[g]
y<-2*x1+x2+g.x+rnorm(1000,sd=0.5)
lmm1<-lmer(y~x1+x2+(1|g))
lmm0<-lmer(y~(1|g))
da.lmm<-dominanceAnalysis(lmm1, null.model=lmm0)
print(da.lmm)
summary(da.lmm)


# GLM analysis

x1<-rnorm(1000)
x2<-rnorm(1000)
x3<-rnorm(1000)
y<-runif(1000)<(1/(1+exp(-(2*x1+x2+1.5*x3))))
glm.1<-glm(y~x1+x2+x3,family="binomial")
da.glm<-dominanceAnalysis(glm.1)
print(da.glm)
summary(da.glm)

# Bootstrap procedure

## No test: 
da.boot<-bootDominanceAnalysis(lm.1,R=1000)
summary(da.boot)

da.glm.boot<-bootDominanceAnalysis(glm.1,R=200)
summary(da.glm.boot)
## End(No test)



