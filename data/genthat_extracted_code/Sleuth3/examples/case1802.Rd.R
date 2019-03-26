library(Sleuth3)


### Name: case1802
### Title: Vitamin C and the Common Cold
### Aliases: case1802
### Keywords: datasets

### ** Examples

str(case1802)
attach(case1802) 

library(MASS)        
## INFERENCE (4 methods)
myTable <- cbind(Cold,NoCold)
row.names(myTable) <- c("Placebo","Vitamin C")
myTable
prop.test(myTable, alternative="greater") # Compare 2 binomial proportions 
# Alternative: pop prop. of first column (cold) in larger in first row (placebo)    
prop.test(myTable, alternative="greater", correct=TRUE)   
prop.test(myTable,correct=TRUE) # Use 2-sided alternative to get CI    
chisq.test(myTable)   # Chi-square test
fisher.test(myTable, alternative="greater")
fisher.test(myTable) #  2-sided alternative to get CI for odds ratio
myGlm1  <- glm(myTable ~ Treatment, family=binomial) # logistic reg (Ch 21)
summary(myGlm1)
beta    <- myGlm1$coef
1 - exp(beta[2])  # 0.3474911
1 - exp(confint(myGlm1,2)) # 0.53365918 0.09042098
# Interpretation: The odds of getting a cold are 35% less on Vitamin C than 
# Placebo (95% confidence interval: 9% to 53% less).

detach(case1802)



