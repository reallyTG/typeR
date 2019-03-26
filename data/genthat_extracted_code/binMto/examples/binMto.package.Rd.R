library(binMto)


### Name: binMto-package
### Title: Asymptotic simultaneous confdence intervals for many-to-one
###   comparisons of proportions
### Aliases: binMto-package
### Keywords: package

### ** Examples


# binMto:
# Calculate and plot approximate simultaneous
# confidene intervals for many-to-one comparisons of a
# dichotomous variable in a one-way model. 

# Example from Table 5 in Koch, HF and Hothorn, LA,
# JSPI 82, 83-99:
# A toxicity study with 100 mice randomised in 4 groups.
# Response x was number of deaths after 6 months.
# Control (n=40, x=4), 10 mg/kg (n=20, x=1),
# 50 mg/kg (n=20, x=6), 100 mg/kg (n=20, x=8).

# Approximate simultaneous 95% add-4-CI: 

many21<-binMto(n=c(40,20,20,20), x=c(4,1,6,8),
 names=c("Control", "10mg", "50mg", "100mg"))

many21

plot(many21)

# Note that normal approximation becomes problematic for np(1-p)<2.




