library(dominanceanalysis)


### Name: da.lm.fit
### Title: Provides coefficient of determination for 'lm' models.
### Aliases: da.lm.fit

### ** Examples

x1<-rnorm(1000)
x2<-rnorm(1000)
y <-x1+x2+rnorm(1000)
df.1=data.frame(y=y,x1=x1,x2=x2)
da.lm.fit(df.1)("names")
da.lm.fit(df.1)(y~x1)



