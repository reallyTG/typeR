library(miceadds)


### Name: mice_inits
### Title: Arguments for 'mice::mice' Function
### Aliases: mice_inits

### ** Examples

#############################################################################
# EXAMPLE 1: Inits for mice imputation
#############################################################################

data(data.ma04, package="miceadds")
dat <- data.ma04

res <- miceadds::mice_inits(dat, ignore=c("group") )
str(res)



