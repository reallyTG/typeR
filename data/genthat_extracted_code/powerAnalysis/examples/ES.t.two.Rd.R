library(powerAnalysis)


### Name: ES.t.two
### Title: Calculating effect size (Cohen's d) of independent two-sample t
###   test
### Aliases: ES.t.two

### ** Examples

## mean, sd, n -> d
ES.t.two(m1=13.5,m2=5.5,sd1=4.1833,sd2=3.02765,n1=14,n2=10)

## mean se, n -> d
ES.t.two(m1=13.5,m2=5.5,se1=1.118034,se2=0.9574271,n1=14,n2=10)

## t and n -> d
ES.t.two(n1=14,n2=10,t=5.4349)

## t, df and n -> d
ES.t.two(t = 5.4349, df = 21.982,n1=14,n2=10)

## t and df -> d (assume n1=n2)
ES.t.two(t = 5.4349, df = 21.982)



