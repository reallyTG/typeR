library(Sleuth3)


### Name: case1803
### Title: Smoking and Lung Cancer
### Aliases: case1803
### Keywords: datasets

### ** Examples

str(case1803)
attach(case1803)
   
## INFERENCE
myTable   <- cbind(Cancer,Control)   # Make a 2-by-2 table of counts 
row.names(myTable)  <- Smoking   # Assign the levels of Smoking as row names  
myTable   

fisher.test(myTable,  alternative="greater")  # Alternative: that odds of Cancer 
  # in first row are greater.
fisher.test(myTable) # 2-sided alternative to get CI for odds ratio
myGlm1  <- glm(myTable ~ Smoking, family=binomial) # logistic reg (Ch 21)
summary(myGlm1)
exp(myGlm1$coef[2]) # 5.37963 : Estimated odds ratio
exp(confint(myGlm1)[2,]) #  1.675169 24.009510:  Approximate confidence interval
# Interpretation: The odds of cancer ar 5.4 times as large for smokers as for 
# non-smokers (95% confidence interval: 1.7 to 24.0 times as large).

detach(case1803)



