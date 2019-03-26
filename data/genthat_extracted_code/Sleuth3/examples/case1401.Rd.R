library(Sleuth3)


### Name: case1401
### Title: Chimp Learning Times
### Aliases: case1401
### Keywords: datasets

### ** Examples

str(case1401)
attach(case1401)
 
## EXPLORATION AND MODEL DEVELOPMENT
plot(Minutes ~ Sign)
myLm1 <- lm(Minutes ~ Chimp + Sign)   
plot(myLm1,which=1)  # Plot residuals (indicates a need for transformation).
logMinutes <- log(Minutes)
myLm2 <- lm(logMinutes ~ Chimp + Sign)
plot(myLm2, which=1)  # This looks fine.
if(require(car)){   # Use the car library                                   
  crPlots(myLm2) # Partial residual plots
}

## INFERENCE AND INTERPRETATION
myLm3  <- update(myLm2, ~ . - Chimp)  # Fit reduced model without Chimp.
anova(myLm3, myLm2)   # Test for Chimp effect.
myLm4 <- update(myLm2, ~ . - Sign)  # Fit reduced model without Sign.
anova(myLm4, myLm2)    # Test for Sign effect.
# Fit 2-way model without intercept to order signs from easiest to hardest 
myAov1 <- aov(logMinutes ~ Sign + Chimp - 1)  
sort(myAov1$coef[1:10]) # Show the ordering of Signs
orderedSign <- factor(Sign,levels=c("listen","drink","shoe","key","more",
      "food","fruit","hat","look","string") )  # Re-order signs, easiest 1st
myAov2 <- aov(logMinutes ~ orderedSign + Chimp - 1)  # Refit
opar <- par(no.readonly=TRUE)  # Store current graphics parameters settings
par(mar=c(4.1,7.1,4.1,2.1)) # Adjust margins to allow room for y-axis labels
## No test: 
## takes too long to run
if(require(multcomp)){   # Use the multcomp library   
  myMultComp    <- glht(myAov2, linfct = mcp(orderedSign = "Tukey"))              
  plot(myMultComp)  # Plot Tukey-adjusted confidence intervals.
  summary(myMultComp)   # Show Tukey-adjusted p-values  pairwise comparisons  
  confint(myMultComp)   # Show Tukey-adjusted 95% confidence intervals  
}
## End(No test)
par(opar) # Restore original graphics parameters settings

## DISPLAY FOR PRESENTATION
myYLab <- "Log Learning Time, Adjusted for Chimp Effect"
myXLab <- "Sign Learned"      
if(require(car)){   # Use the car library  
crPlots(myAov2, ylab=myYLab, xlab=myXLab,
  main="Learning Times by Sign, Adjusted for Chimp Effects",
  layout=c(1,1)) # Click on graph area to show next page (Just use first one.) 
}  

detach(case1401)



