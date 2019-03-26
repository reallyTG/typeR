library(Sleuth3)


### Name: case1302
### Title: Pygmalion Effect
### Aliases: case1302
### Keywords: datasets

### ** Examples

str(case1302)
attach(case1302)

## EXPLORATION AND MODEL DEVELOPMENT
plot(Score ~ as.numeric(Company),cex=1.5, pch=21, 
  bg=ifelse(Treat=="Pygmalion","blue","light gray"))
myLm1   <- lm(Score ~ Company + Treat + Company:Treat) # Fit with interaction.
plot(myLm1,which=1)  # Plot residuals.
myLm2   <- update(myLm1, ~ . - Company:Treat) # Refit, without interaction.
anova(myLm2, myLm1)  # Show extra-ss-F-test p-value (for interaction effect).
if(require(car)){   # Use the car library                               
  crPlots(myLm2)
}

## INFERENCE
myLm3 <- update(myLm2, ~ . - Company)  # Fit reduced model without Company.
anova(myLm3, myLm2)   # Test for Company effect.
summary(myLm2)   # Show estimate and p-value for Pygmalion effect.  
confint(myLm2,11)  # Show 95% CI for Pygmalion effect.

## DISPLAY FOR PRESENTATION
beta        <- myLm2$coef
partialRes  <- myLm2$res + beta[11]*ifelse(Treat=="Pygmalion",1,0) # partial res
boxplot(partialRes ~ Treat,  # Boxplots of partial residuals for each treatment
  ylab="Average Test Score, Adjusted for Company Effect (Deviation from Company Average)",
  names=c("19 Control Platoons","10 Pygmalion Treated Platoons"),
  col="green", boxlwd=2, medlwd=2,whisklty=1, whisklwd=2, staplewex=.2, 
  staplelwd=2, outlwd=2, outpch=21, outbg="green", outcex=1.5	)	   

detach(case1302)



