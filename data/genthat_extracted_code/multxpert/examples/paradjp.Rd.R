library(multxpert)


### Name: paradjp
### Title: Common parametric procedures: Adjusted p-values
### Aliases: paradjp
### Keywords: procedure p -value

### ** Examples


# Consider a clinical trial conducted to evaluate the effect of three
# doses of a treatment compared to a placebo with respect to a normally
# distributed endpoint

# Three null hypotheses of no effect are tested in the trial:
# Null hypothesis H1: No difference between Dose 1 and Placebo
# Null hypothesis H2: No difference between Dose 2 and Placebo
# Null hypothesis H3: No difference between Dose 3 and Placebo

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

# Compute one-sided adjusted p-values for the single-step Dunnett procedure
paradjp(stat, n, proc="Single-step Dunnett")

# Compute one-sided adjusted p-values for the single-step and 
# step-down Dunnett procedures
paradjp(stat, n, proc=c("Single-step Dunnett", "Step-down Dunnett"))




