library(zipfR)


### Name: print.vgc
### Title: Printing Vocabulary Growth Curves (zipfR)
### Aliases: print.vgc summary.vgc
### Keywords: print

### ** Examples


## load Brown "informative" prose empirical vgc
data(BrownInform.emp.vgc)

## summary, print (random subset) and print all
summary(BrownInform.emp.vgc)
print(BrownInform.emp.vgc)
print(BrownInform.emp.vgc,all=TRUE)

## load Brown informative prose spectrum
## and get estimate a fzm model
data(BrownInform.spc)
fzm <- lnre("fzm",BrownInform.spc,exact=FALSE)

## obtain expected vgc up to 2M tokens
## with spectrum elements up to V_3
## and variances
fzm.vgc <- lnre.vgc(fzm,(1:100)*2e+4,m.max=3,variances=TRUE)

## summary and print
summary(fzm.vgc)
print(fzm.vgc)
print(fzm.vgc,all=TRUE)




