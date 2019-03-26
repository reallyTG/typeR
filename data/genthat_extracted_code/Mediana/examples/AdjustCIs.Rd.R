library(Mediana)


### Name: AdjustCIs
### Title: AdjustCIs function
### Aliases: AdjustCIs

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
sd<-rep(9.5,3)

# Study design is balanced with 180 patients per treatment arm
n<-180

# Bonferroni, Holm, Hochberg, Hommel and Fixed-sequence procedure
proc = c("BonferroniAdj", "HolmAdj", "FixedSeqAdj", "DunnettAdj", "StepDownDunnettAdj")

# Equally weighted
sapply(proc, function(x) {AdjustCIs(est,
                                    proc = x,
                                    par = parameters(sd = sd,
                                                     n = n,
                                                     covprob = 0.975,
                                                     weight = weight))})



