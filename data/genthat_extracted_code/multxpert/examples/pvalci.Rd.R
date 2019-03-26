library(multxpert)


### Name: pvalci
### Title: Common p-value-based procedures: Simultaneous confidence
###   intervals
### Aliases: pvalci
### Keywords: procedure confidence limits

### ** Examples


# Consider a clinical trial conducted to evaluate the effect of three
# doses of a treatment compared to a placebo with respect to a normally
# distributed endpoint 

# Three null hypotheses of no effect are tested in the trial:
# Null hypothesis H1: No difference between Dose 1 and Placebo
# Null hypothesis H2: No difference between Dose 2 and Placebo
# Null hypothesis H3: No difference between Dose 3 and Placebo

# Null hypotheses of no treatment effect are equally weighted
weight<-c(1/3,1/3,1/3)

# Treatment effect estimates (mean  dose-placebo differences)
est<-c(2.3,2.5,1.9)

# Pooled standard deviation
sd<-9.5

# Study design is balanced with 180 patients per treatment arm
n<-180

# Standard errors
stderror<-rep(sd*sqrt(2/n),3)

# T-statistics associated with the three dose-placebo tests
stat<-est/stderror

# Compute degrees of freedom
nu<-2*(n-1)

# Compute raw one-sided p-values
rawp<-1-pt(stat,nu)

# Compute lower one-sided simultaneous confidence limits 
# for the Bonferroni procedure 
pvalci(rawp,est,stderror,weight,covprob=0.975,proc="Bonferroni")

# Compute lower one-sided simultaneous confidence limits
# for the Holm and Fixed-sequence procedures
pvalci(rawp,est,stderror,weight,covprob=0.975,proc=c("Holm", "Fixed-sequence"))




