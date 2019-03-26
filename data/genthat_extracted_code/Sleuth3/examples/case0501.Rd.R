library(Sleuth3)


### Name: case0501
### Title: Diet Restriction and Longevity
### Aliases: case0501
### Keywords: datasets

### ** Examples

str(case0501)
attach(case0501)

# Re-order levels for better boxplot organization: 
myDiet  <- factor(Diet, levels=c("NP","N/N85","N/R50","R/R50","lopro","N/R40") ) 
 
myNames <- c("NP(49)","N/N85(57)","N/R50(71)","R/R50(56)","lopro(56)",
  "N/R40(60)")   # Make these for boxplot labeling.
boxplot(Lifetime ~ myDiet, ylab= "Lifetime (months)", names=myNames, 
  xlab="Treatment (and sample size)") 
myAov1   <- aov(Lifetime ~ Diet) # One-way analysis of variance
plot(myAov1, which=1) # Plot residuals versus estimated means.
summary(myAov1) 
pairwise.t.test(Lifetime,Diet, pool.SD=TRUE, p.adj="none") # All t-tests

## p-VALUES AND CONFIDENCE INTERVALS FOR SPECIFIED COMPARISONS OF MEANS
if(require(multcomp)){
  diet    <- factor(Diet,labels=c("NN85", "NR40", "NR50", "NP", "RR50", "lopro")) 
  myAov2  <- aov(Lifetime ~ diet - 1) 
  myComparisons <- glht(myAov2,
          linfct=c("dietNR50 - dietNN85 = 0", 
          "dietRR50  - dietNR50 = 0",
          "dietNR40  - dietNR50 = 0",
          "dietlopro - dietNR50 = 0",
          "dietNN85  - dietNP   = 0")   ) 
  summary(myComparisons,test=adjusted("none")) # No multiple comparison adjust.
  confint(myComparisons, calpha = univariate_calpha()) # No adjustment
}

## EXAMPLE 5: BOXPLOTS FOR PRESENTATION  
boxplot(Lifetime ~ myDiet, ylab= "Lifetime (months)", names=myNames,
  main= "Lifetimes of Mice on 6 Diet Regimens",
  xlab="Diet (and sample size)", col="green", boxlwd=2, medlwd=2, whisklty=1, 
  whisklwd=2, staplewex=.2, staplelwd=2, outlwd=2, outpch=21, outbg="green", 
  outcex=1.5)   
                
detach(case0501)




