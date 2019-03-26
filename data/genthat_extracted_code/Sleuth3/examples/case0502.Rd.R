library(Sleuth3)


### Name: case0502
### Title: The Spock Conspiracy Trial
### Aliases: case0502
### Keywords: datasets

### ** Examples

str(case0502)  
attach(case0502) 

# Make new factor level names (with sample sizes) for boxplots
myNames <- c("A (5)", "B (6)", "C (9)", "D (2)", "E (6)", "F (9)", "Spock's (9)")
  
boxplot(Percent ~ Judge, ylab = "Percent of Women on Judges' Venires",
  names = myNames, xlab = "Judge (and number of venires)",
  main = "Percent Women on Venires of 7 Massachusetts Judges") 
myAov1  <- aov(Percent ~ Judge)  
plot(myAov1, which=1)   # Residual plot
summary(myAov1) # Initial screening. Any evidence of judge differences? (yes)
   
## ANALYSIS 1. TWO-SAMPLE t-TEST (ASSUMING NON-SPOCK JUDGES HAVE A COMMON MEAN)
SpockOrOther <- factor(ifelse(Judge=="Spock's","Spock","Other"))                                   
aovFull      <- aov(Percent ~ Judge) 
aovReduced   <- aov(Percent ~ SpockOrOther) 
anova(aovReduced,aovFull) #Any evidence that 7 mean fits better than the 2 mean?       
t.test(Percent ~ SpockOrOther, var.equal=TRUE) # Evidence that 2 means differ?  

## ANALYSIS 2. COMPARE SPOCK MEAN TO AVERAGE OF OTHER MEANS 
  myAov3        <- aov(Percent ~ Judge - 1) 
  myContrast    <- rbind(c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6, - 1))
if(require(multcomp)){  # use multcomp library
  myComparison  <- glht(myAov3, linfct=myContrast) 
  summary(myComparison, test=adjusted("none"))   
  confint(myComparison) 
}

## BOXPLOTS FOR PRESENTATION   
boxplot(Percent ~ Judge,  ylab= "Percent of Women on Judges' Venires",
        names=myNames, xlab="Judge (and number of venires)",
        main= "Percent Women on Venires of 7 Massachusetts Judges",
        col="green", boxlwd=2,  medlwd=2,  whisklty=1,  whisklwd=2,
        staplewex=.2, staplelwd=2,  outlwd=2,  outpch=21, outbg="green",
        outcex=1.5)         
        
detach(case0502)  



