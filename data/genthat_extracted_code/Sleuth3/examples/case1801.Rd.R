library(Sleuth3)


### Name: case1801
### Title: Obesity and Heart Disease
### Aliases: case1801
### Keywords: datasets

### ** Examples

str(case1801)
attach(case1801)
   
## EXPLORATION
myTable             <- cbind(Deaths,NonDeaths)  # Form a 2 by 2 table of counts
row.names(myTable)  <- Obesity  # Assign the levels of Obesity as row names  
myTable   # Show the table

## INFERENCE (4 methods for getting p-values and confidence intervals)
prop.test(myTable, alternative="greater", correct=FALSE) # Compare 2 proportions
prop.test(myTable, alternative="greater", correct=TRUE) # ...with cont. corect.  
prop.test(myTable,correct=TRUE) # 2-sided alternative (default) to get CI
chisq.test(myTable) # Pearson's Chi-Squared Test
fisher.test(myTable, alternative="greater") # Fisher's exact test  
fisher.test(myTable) # 2-sided alternative to get CI for odds ratio
myGlm1  <- glm(myTable ~ Obesity, family=binomial)  # Logistic reg (CH 21)
summary(myGlm1)  # Get p-value-- 0.734
beta    <- myGlm1$coef
exp(beta[2])  #Odds of death are estimated to be 17% higher for  obese women 
exp(confint(myGlm1,2)) # 95% confidence interval  


## GRAPHICAL DISPLAY FOR PRESENTATION
myTable
#        Deaths NonDeaths
#Obese        16      2045
#NotObese      7      1044
prop.test(16,(16+2045)) #For one proportion, est: 0.0078 95% CI: 0.0046 to 0.013
prop.test(7,(7+1044)) #For one proportion, est: 0067 95% CI: 0.0029 to 0.014
pHat    <- c(0.007763222, 0.006660324)*1000 # Get estimated deaths per 1,000 women
lower95 <- c(0.00459943, 0.002921568)*1000
upper95 <- c(0.01287243, 0.014318321)*1000

if(require(Hmisc)) { # Use Hmisc library 
  myObj   <- Cbind(pHat,lower95,upper95) 
  Dotplot(Obesity ~ myObj,   # Draw a dot plot of estimates and CIs
    xlab="Estimated CVD Deaths Per 1,000 Women (and 95% Confidence Intervals)",
    ylab="Weight Category", ylim=c(.5,2.5), cex=2)
}


detach(case1801)



