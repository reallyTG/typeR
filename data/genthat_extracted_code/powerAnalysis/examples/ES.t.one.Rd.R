library(powerAnalysis)


### Name: ES.t.one
### Title: Calculating effect size (Cohen's d) of one-sample t test
### Aliases: ES.t.one

### ** Examples

## mean, sd and mu -> d
ES.t.one(m=-0.0938268,sd=0.9836668,mu=0)

## mean, se, n and mu -> d
ES.t.one(m=-0.0938268,se=0.1391115,n=50,mu=0)

## t and df -> d (df=n-1)
ES.t.one(t = -0.6745,df = 49)

## t and n -> d ((df=n-1))
ES.t.one(t = -0.6745,n = 50)



