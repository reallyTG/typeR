library(multxpert)


### Name: pvaladjp
### Title: Common p-value-based procedures: Adjusted p-values
### Aliases: pvaladjp
### Keywords: procedure p -value

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

# Compute adjusted p-values for the Bonferroni procedure 
pvaladjp(rawp, weight, proc="Bonferroni")

# Compute adjusted p-values for the Hommel and Fallback procedures
pvaladjp(rawp, weight, proc=c("Hommel", "Fallback"))

# Generate decision rules for the Holm procedure 
# using a one-sided alpha=0.025
pvaladjp(rawp, weight, alpha=0.025, proc="Holm", printDecisionRules=TRUE)




