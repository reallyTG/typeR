library(Tmisc)


### Name: lmp
### Title: Linear model p-value
### Aliases: lmp

### ** Examples

# simulate some (e.g. SNP genotype) data
set.seed(42)
n=20
d=data.frame(x1=rbinom(n,2,.5), x2=rbinom(n,2,.5))
d=transform(d, y=x1+x2+rnorm(n))
#fit the linear model
fit=lm(y ~ x1 + x2, data=d)
#shows that the F-test is 0.006641
summary(fit)
#can't access that p-value using this
names(summary(fit)) 
# this doesn't work either
names(fit)
lmp(fit)




