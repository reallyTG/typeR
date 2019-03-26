library(mosaic)


### Name: xchisq.test
### Title: Augmented Chi-squared test
### Aliases: xchisq.test

### ** Examples

# Physicians' Health Study data
phs <- cbind(c(104,189),c(10933,10845)) 
rownames(phs) <- c("aspirin","placebo") 
colnames(phs) <- c("heart attack","no heart attack") 
phs 
xchisq.test(phs) 
xchisq.test(sex ~ substance, data = HELPrct)



