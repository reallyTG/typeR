library(dominanceanalysis)


### Name: da.glm.fit
### Title: Provides fit indices for GLM models.
### Aliases: da.glm.fit

### ** Examples

x1<-rnorm(1000)
x2<-rnorm(1000)
x3<-rnorm(1000)
y<-factor(runif(1000) > exp(x1+x2+x3)/(1+exp(x1+x2+x3)))
df.1=data.frame(x1,x2,x3,y)
da.glm.fit(data=df.1)("names")
da.glm.fit(data=df.1, family.glm='binomial')(y~x1)



