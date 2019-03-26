library(HIest)


### Name: HItest
### Title: Compare the likelihood of hybrid classification to MLE estimates
###   of ancestry and heterozygosity.
### Aliases: HItest
### Keywords: ~kwd1 ~kwd2

### ** Examples

	## Not run: 
##D data(Bluestone)
##D Bluestone <- replace(Bluestone,is.na(Bluestone),-9)
##D # parental allele frequencies (assumed diagnostic)
##D BS.P <- data.frame(Locus=names(Bluestone),Allele="BTS",P1=1,P2=0)
##D 
##D # estimate ancestry and heterozygosity
##D BS.est <-HIC(Bluestone)
##D 
##D # calculate likelihoods for early generation hybrid classes
##D BS.class <- HIclass(Bluestone,BS.P,type="allele.count")
##D 
##D # compare classification with maximum likelihood estimates
##D BS.test <- HItest(BS.class,BS.est)
##D 
##D table(BS.test$c1)
##D # all 41 are TRUE, meaning the best classification is at least 2 log-likelihood units
##D # better than the next best
##D 
##D table(BS.test$c2)
##D # 2 are TRUE, meaning the MLE S and H are within 2 log-likelihood units of the best
##D # classification, i.e., the simple classification is rejected in all but 2 cases.
##D 
##D table(BS.test$Best.class,BS.test$c2)
##D # individuals were classified as F2-like (class 3) or backcross to CTS (class 4), but
##D # only two of the F2's were credible 
##D 
##D BS.test[BS.test$c2,]
##D # in only one case was the F2 classification a better fit (based on AIC) than the
##D # continuous model.
## End(Not run)



