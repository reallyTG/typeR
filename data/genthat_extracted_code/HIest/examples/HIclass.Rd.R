library(HIest)


### Name: HIclass
### Title: Calculate likelihoods for early generation hybrid genotype
###   classes
### Aliases: HIclass
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(Bluestone)
Bluestone <- replace(Bluestone,is.na(Bluestone),-9)
# parental allele frequencies (assumed diagnostic)
BS.P <- data.frame(Locus=names(Bluestone),Allele="BTS",P1=1,P2=0)

# estimate ancestry and heterozygosity
# BS.est <-HIest(Bluestone,BS.P,type="allele.count")

# shortcut for diagnostic markers
BS.est <- HIC(Bluestone)

# calculate likelihoods for early generation hybrid classes
BS.class <- HIclass(Bluestone,BS.P,type="allele.count")

# compare classification with maximum likelihood estimates
BS.test <- HItest(BS.class,BS.est,thresholds=c(2,2))

table(BS.test$c1)
# all 41 are TRUE, meaning the best classification is at least 2 log-likelihood units
# better than the next best

table(BS.test$c2)
# 2 are TRUE, meaning the MLE S and H are within 2 log-likelihood units of the best
# classification, i.e., the simple classification is rejected in all but 2 cases

table(BS.test$Best.class,BS.test$c2)
# individuals were classified as F2-like (class 3) or backcross to CTS (class 4),
# but only two of the F2's were credible 

BS.test[BS.test$c2,]
# in only one case was the F2 classification a better fit (based on AIC) than the
# continuous model.

# equivalent to the AIC criterion:
BS.test <- HItest(BS.class,BS.est,thresholds=c(2,1))




