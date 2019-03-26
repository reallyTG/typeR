library(merror)


### Name: lrt
### Title: Likelihood ratio test for all betas equalling one.
### Aliases: lrt
### Keywords: htest

### ** Examples


data(pm2.5)

lrt(pm2.5) # compare all 5 samplers (4 personal and 1 frm)

lrt(pm2.5[,1:4]) # compare only the personal samplers

stem(lrt(pm2.5)$beta.bars) # examine the estimated betas




