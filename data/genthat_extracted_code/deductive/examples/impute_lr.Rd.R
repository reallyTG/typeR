library(deductive)


### Name: impute_lr
### Title: Impute values derived from linear (in)equality restrictions.
### Aliases: impute_lr impute_lr,data.frame,validator-method

### ** Examples


v <- validate::validator(y ==2,y + z ==3, x +y <= 0)
dat <- data.frame(x=NA_real_,y=NA_real_,z=NA_real_)
impute_lr(dat,v)




