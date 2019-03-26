library(Mediana)


### Name: AdjustPvalues
### Title: AdjustPvalues function
### Aliases: AdjustPvalues

### ** Examples

# Bonferroni, Holm, Hochberg, Hommel and Fixed-sequence procedure
proc = c("BonferroniAdj", "HolmAdj", "HochbergAdj", "HommelAdj", "FixedSeqAdj", "FallbackAdj")
rawp = c(0.012, 0.009, 0.023)

# Equally weighted
sapply(proc, function(x) {AdjustPvalues(rawp,
                                        proc = x)})

# Unequally weighted (no effect on the fixed-sequence procedure)
sapply(proc, function(x) {AdjustPvalues(rawp,
                                        proc = x,
                                        par = parameters(weight = c(1/2, 1/4, 1/4)))})

# Dunnett procedures
# Compute one-sided adjusted p-values for the single-step Dunnett procedure
# Three null hypotheses of no effect are tested in the trial:
# Null hypothesis H1: No difference between Dose 1 and Placebo
# Null hypothesis H2: No difference between Dose 2 and Placebo
# Null hypothesis H3: No difference between Dose 3 and Placebo

# Treatment effect estimates (mean  dose-placebo differences)
est = c(2.3,2.5,1.9)

# Pooled standard deviation
sd = 9.5

# Study design is balanced with 180 patients per treatment arm
n = 180

# Standard errors
stderror = rep(sd*sqrt(2/n),3)

# T-statistics associated with the three dose-placebo tests
stat = est/stderror

# One-sided pvalue
rawp = 1-pt(stat,2*(n-1))

# Adjusted p-values based on the Dunnett procedures
# (assuming that each test statistic follows a t distribution)
AdjustPvalues(rawp,proc = "DunnettAdj",par = parameters(n = n))
AdjustPvalues(rawp,proc = "StepDownDunnettAdj",par = parameters(n = n))

# Parallel gatekeeping
# Consider a clinical trial with two families of null hypotheses
# Family 1: Primary null hypotheses (one-sided p-values)
# H1 (Endpoint 1), p1=0.0082
# H2 (Endpoint 2), p2=0.0174
# Family 2: Secondary null hypotheses (one-sided p-values)
# H3 (Endpoint 3), p3=0.0042
# H4 (Endpoint 4), p4=0.0180

# Define raw p-values
rawp<-c(0.0082,0.0174, 0.0042,0.0180)

# Define hHypothesis included in each family
family = families(family1 = c(1, 2),
                  family2 = c(3, 4))

# Define component procedure of each family
component.procedure = families(family1 ="HolmAdj",
                               family2 = "HolmAdj")

# Truncation parameter of each family
gamma = families(family1 = 0.5,
                 family2 = 1)

adjustp = AdjustPvalues(rawp,
                        proc = "ParallelGatekeepingAdj",
                        par = parameters(family = family,
                                         proc = component.procedure,
                                         gamma = gamma))




