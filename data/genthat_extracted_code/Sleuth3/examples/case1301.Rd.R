library(Sleuth3)


### Name: case1301
### Title: Seaweed Grazers
### Aliases: case1301
### Keywords: datasets

### ** Examples

str(case1301)
attach(case1301)
      
## EXPLORATION AND MODEL DEVELOPMENT
plot(Cover ~ Treat,xlab="Animals Present",ylab="Remaining Seaweed Coverage (%)")
myLm1 <- lm(Cover ~ Block + Treat + Block:Treat) 
plot(myLm1,which=1)  
ratio <- Cover/(100 - Cover)  
logRatio  <- log(ratio) 
myLm2 <- lm(logRatio ~ Block + Treat + Block:Treat)  
plot(myLm2, which=1)  
myLm3  <- lm(logRatio ~ Block + Treat)  
anova(myLm3, myLm2) # Test for interaction with extra ss F-test 
if(require(car)){   # Use the car library
  crPlots(myLm3)   # Partial residual plots
  myLm4  <- lm(logRatio ~ Treat)   
  anova(myLm4, myLm3)     # Test for Block effect
  myLm5  <- lm(logRatio ~ Block)  
  anova(myLm5, myLm3)     # Test for Treatment effect
  lmp <- factor(ifelse(Treat %in% c("L", "Lf", "LfF"), "yes", "no"))  
  sml <- factor(ifelse(Treat %in% c("f", "fF", "Lf", "LfF"), "yes","no")) 
  big <- factor(ifelse(Treat %in% c("fF", "LfF"), "yes","no"))  
  myLm6  <- lm(logRatio ~ Block + lmp + sml + big)  
  crPlots(myLm6) 
  myLm7  <- lm(logRatio ~ Block + (lmp + sml + big)^2)  
  anova(myLm6, myLm7)  # Test for interactions of lmp, sml, and big

## INFERENCE AND INTERPRETATION
  summary(myLm6)   # Get p-values for lmp, sml, and big effects; R^2 = .8522
  beta <- myLm6$coef  
  exp(beta[9:11])  
  exp(confint(myLm6,9:11) ) 
   
  myLm7 <- update(myLm6, ~ . - lmp)
  summary(myLm7)  # R^2 = .4568; Note .8522-.4580 = 39.54# (explained by limpets)  
  myLm8 <- update(myLm6, ~ . - big)
  summary(myLm8)  # R^2 = .8225; Note .8522-.8255= 2.97# (explained by big fish) 
  myLm9 <- update(myLm6, ~ . - sml)
  summary(myLm9)  # R^2: .8400; Note .8522-.8400 = 1.22# (explained by small fish)

## DISPLAY FOR PRESENTATION 
  myYLab <- "Adjusted Seaweed Regeneration (Log Scale; Deviation from Average)"
  crPlots(myLm6, ylab=myYLab, ylim=c(-2.2,2.2), 
    main="Effects of Blocks and Treatments on Log Regeneration Ratio, Adjusted for Other Factors")
}
  
detach(case1301)



