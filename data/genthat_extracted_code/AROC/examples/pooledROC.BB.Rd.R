library(AROC)


### Name: pooledROC.BB
### Title: Bayesian bootstrap estimation of the pooled ROC curve.
### Aliases: pooledROC.BB

### ** Examples

library(AROC)
data(psa)
# Select the last measurement
newpsa <- psa[!duplicated(psa$id, fromLast = TRUE),]

# Log-transform the biomarker
newpsa$l_marker1 <- log(newpsa$marker1)
## No test: 
m0_BB <- pooledROC.BB(newpsa$l_marker1[newpsa$status == 0],
newpsa$l_marker1[newpsa$status == 1], p = seq(0,1,l=101), B = 5000)

summary(m0_BB)

plot(m0_BB)
## End(No test)
## Don't show: 
m0_BB <- pooledROC.BB(newpsa$l_marker1[newpsa$status == 0],
newpsa$l_marker1[newpsa$status == 1], p = seq(0,1,l=101), B = 500)

summary(m0_BB)

plot(m0_BB)
## End(Don't show)



