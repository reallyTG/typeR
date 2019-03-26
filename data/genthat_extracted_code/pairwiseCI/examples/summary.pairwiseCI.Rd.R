library(pairwiseCI)


### Name: summary.pairwiseCI
### Title: Summary function for pairwiseCI
### Aliases: summary.pairwiseCI
### Keywords: print

### ** Examples


data(rooting)

rootRR<-pairwiseCI(cbind(root,noroot) ~ IBA,
 data=rooting, by="Age", method="Prop.ratio")

# after calling summary,
# extracting parts of the output is easier: 

srootRR<-summary(rootRR)

srootRR$'20'$conf.int$upper




