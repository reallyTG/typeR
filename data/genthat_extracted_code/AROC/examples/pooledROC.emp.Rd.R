library(AROC)


### Name: pooledROC.emp
### Title: Empirical estimation of the pooled ROC curve.
### Aliases: pooledROC.emp

### ** Examples

library(AROC)
data(psa)
# Select the last measurement
newpsa <- psa[!duplicated(psa$id, fromLast = TRUE),]

# Log-transform the biomarker
newpsa$l_marker1 <- log(newpsa$marker1)
## No test: 
m0_emp <- pooledROC.emp(newpsa$l_marker1[newpsa$status == 0],
newpsa$l_marker1[newpsa$status == 1], p = seq(0,1,l=101), B = 500)

summary(m0_emp)

plot(m0_emp)
## End(No test)
## Don't show: 
m0_emp <- pooledROC.emp(newpsa$l_marker1[newpsa$status == 0],
newpsa$l_marker1[newpsa$status == 1], p = seq(0,1,l=101), B = 0)

summary(m0_emp)

plot(m0_emp)
## End(Don't show)



