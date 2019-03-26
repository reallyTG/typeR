library(powerAnalysis)


### Name: ES.t.paired
### Title: Calculating effect size (Cohen's d) of paired two-sample t test
### Aliases: ES.t.paired

### ** Examples

## md, sd -> d
ES.t.paired(md=-0.08062384,sd=1.401886)

## md,se -> d
ES.t.paired(md=-0.08062384,se=0.1982566,n=50)

## t, df -> d
ES.t.paired(t=-0.4067,df=49)

## t, n -> d
ES.t.paired(t=-0.4067,n=50)



