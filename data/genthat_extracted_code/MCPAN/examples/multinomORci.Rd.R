library(MCPAN)


### Name: multinomORci
### Title: Simultaneous confidence intervals for odds ratios comparing
###   multiple odds and multiple treatments in a contingency table
### Aliases: multinomORci
### Keywords: htest

### ** Examples


# Randomized clinical trial 2 treatment groups (injection of saline or sterile water)
# to cure chronic pain after whiplash injuries. Response are 3 (ordered) categories,
# 'no change', 'improved', 'much improved'. Source: Hand, Daly, Lunn, McConway,
# Ostrowski (1994): A handbook of small data sets. Chapman & Hall, Example 124, page 993


dwi <- data.frame("no.change"=c(1,14), "improved"=c(9,3), "much.improved"=c(10,3))
rownames(dwi) <- c("sterile3", "saline3")

dwi

DP1dwi <- multinomORci(Ymat=dwi, cmcat="Dunnett", cmgroup="Tukey", cimethod="DP", BSIM=5000)
DP1dwi 

# at logit-scale (i.e., not backtransformation)
print(DP1dwi , exp=FALSE)

## Not run: 
##D # Compute asymptotic Wald-type intervals
##D Waldwbc <- multinomORci(Ymat=dwi, cmcat="Dunnett", cmgroup="Tukey", cimethod="Wald")
##D Waldwbc
##D print(Waldwbc, exp=FALSE)
## End(Not run)




