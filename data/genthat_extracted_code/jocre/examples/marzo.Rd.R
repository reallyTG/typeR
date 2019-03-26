library(jocre)


### Name: marzo
### Title: Bioequivalence study of ticlopidine hydrochloride
### Aliases: marzo
### Keywords: datasets

### ** Examples

data(marzo)

## An example analysis of Cmax assuming log-normality

# Difference of log(Cmax)
marzo$deltalogCmax <- log(marzo$Cmax_T) - log(marzo$Cmax_R)

# Estimated mean treatment effect with SE 
mean(marzo$deltalogCmax)
sd(marzo$deltalogCmax) / sqrt(nrow(marzo))

# Two one-sided test (TOST) p-values
t.test(x=marzo$deltalogCmax, alternative="less", mu=log(1.25))$p.value
t.test(x=marzo$deltalogCmax, alternative="greater", mu=log(0.80))$p.value

# 90% TOST confidence interval
t.test(x=marzo$deltalogCmax, conf.level=0.9)$conf.int[1:2]



