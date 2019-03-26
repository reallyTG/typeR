library(HIest)


### Name: HIest-package
### Title: Functions for estimating hybrid indices (ancestry and
###   heterozygosity) and fitting genomic clines.
### Aliases: HIest-package
### Keywords: package

### ** Examples

	## Not run: 
##D data(Bluestone)
##D 
##D ######################
##D # Fit genomic clines #
##D ######################
##D 
##D data(Bluestone)
##D BS.fit <- Cline.fit(Bluestone[,1:12],model=c("logit.logistic","Barton"))
##D Cline.plot(BS.fit)
##D 
##D ########################################
##D # Estimate ancestry and heterozygosity #
##D ########################################
##D 
##D Bluestone <- replace(Bluestone,is.na(Bluestone),-9)
##D 
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
##D BS.test <- HItest(BS.class,BS.est,thresholds=c(2,2))
##D 
##D table(BS.test$c1)
##D # all 41 are TRUE, meaning the best classification is at least 2 log-likelihood units 
##D # better than the next best
##D 
##D table(BS.test$c2)
##D # 2 are TRUE, meaning the MLE S and H are within 2 log-likelihood units of the best
##D # classification, i.e., the simple classification is rejected in all but 2 cases
##D 
##D table(BS.test$Best.class,BS.test$c2)
##D # individuals were classified as F2-like (class 3) or backcross to CTS (class 4), but
##D # only two of the F2's were credible 
##D 
##D BS.test[BS.test$c2,]
##D # in only one case was the F2 classification a better fit (based on AIC) than the
##D # continuous model.
##D 
##D # equivalent to the AIC criterion:
##D BS.test <- HItest(BS.class,BS.est,thresholds=c(2,1))
##D 
##D #########################
##D # three-way hybrid zone #
##D #########################
##D 
##D # for example: make each parental, F1, F2, and backcross
##D G <- rbind(
##D rep(1,12),rep(1,12),
##D rep(2,12),rep(2,12),
##D rep(3,12),rep(3,12),
##D rep(1,12),rep(2,12),
##D rep(1:2,each=6),rep(1:2,6),
##D rep(1,12),rep(1:2,6),
##D rep(2,12),rep(1:2,6),
##D rep(1,12),rep(3,12),
##D rep(c(1,3),each=6),rep(c(1,3),6),
##D rep(1,12),rep(c(1,3),6),
##D rep(3,12),rep(c(1,3),6),
##D rep(2,12),rep(3,12),
##D rep(2:3,each=6),rep(2:3,6),
##D rep(3,12),rep(2:3,6),
##D rep(2,12),rep(2:3,6)
##D )
##D 
##D # 12 diagnostic markers
##D P <- data.frame(Locus=rep(1:12,each=3), allele=rep(1:3,12), P1=rep(c(1,0,0),12), 
##D P2=rep(c(0,1,0),12), P3=rep(c(0,0,1),12))
##D 
##D # find MLE with simulated annealing ... takes a few minutes with default iterations
##D # Est <- threeway(G,P,method="SANN",surf=FALSE)
##D 
##D # shortcut for diagnostic markers
##D Est <- HIC3(G,P)
##D CL <- thirdclass(G,P)
## End(Not run)



