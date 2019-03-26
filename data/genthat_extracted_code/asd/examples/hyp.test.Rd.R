library(asd)


### Name: hyp.test
### Title: Closed Testing for ASD
### Aliases: hyp.test
### Keywords: design

### ** Examples


stage1 <- dunnett.test(c(0.75,1.5,2.25))
stage2 <- dunnett.test(c(0.15,1.75,2.15))
comb.test <- combn.test(stage1,stage2,weight=0.5)
hyp.test(comb.test,level=0.025,full.hyp=FALSE)

# more output
hyp.test(comb.test,level=0.025,full.hyp=TRUE)




