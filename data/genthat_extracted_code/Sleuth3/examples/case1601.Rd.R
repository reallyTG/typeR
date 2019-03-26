library(Sleuth3)


### Name: case1601
### Title: Sites of Short- and Long-Term Memory
### Aliases: case1601
### Keywords: datasets

### ** Examples

str(case1601)
attach(case1601)

## EXPLORATION 
short <- (Week2 + Week4)/2
long  <- (Week8 + Week12 + Week16)/3
myPointCode <- ifelse(Treatment=="Control",15,16)
myPointColor <- ifelse(Treatment=="Control","orange","green")
plot(long ~ short, pch=myPointCode, col=myPointColor, cex=2)
abline(h=mean(long),lty=2)
abline(v=mean(short),lty=2)
identify(short,long,labels=Monkey)   # Identify outliers; press Esc when done

## INFERENCE USING HOTELLING's T-SQUARED TEST
myLm1     <- lm(cbind(short,long) ~ Treatment)  # Full model
myLm2     <- lm(cbind(short,long) ~ 1) # Reduced model, with only intercept
anova(myLm2, myLm1, test="Hotelling") # p-value for Treatment effect
# confidence intervals
n1  <- sum(Treatment=="Control")  # 7 control monkeys
n2  <- sum(Treatment=="Treated")  # 11 treated monkeys
multiplier    <- sqrt(2*((n1+n2-2)/(n1+n2-3))*qf(.95,2,n1+n2-3)) # Sleuth p. 492
summary(myLm1)
shortEffect   <- myLm1$coef[2,1] # Difference in sample averages; Short
seShortEffect <- 3.352   # Read this from summary(myLm1)
halfWidth <- multiplier*seShortEffect  # Half width of 95% confidence interval
shortEffect + c(-1,1)*halfWidth #95% CI for effect of treatment on Short
 longEffect    <- myLm1$coef[2,2] # Difference in sample averages; Long
seLongEffect  <- 3.2215  # Read this from summary(myLm1)
halfWidth     <- multiplier*seLongEffect # Half width of 95% confidence interval  
longEffect + c(-1,1)*halfWidth  #95% CI for effect of treatment on Long


## GRAPHICAL DISPLAY FOR PRESENTATION
myPointCode   <- ifelse(Treatment=="Control",21,22)
myPointColor  <- ifelse(Treatment=="Control","green","orange")
plot(long ~ jitter(short),
  xlab="Short-Term Memory Score (Percent Correct)",
  ylab="Long-Term Memory Score (Percent Correct)",
  main="Memory Scores for 11 Hippocampus-Blocked and 7 Control Monkeys",
  pch=myPointCode, bg=myPointColor, cex=2.5, lwd=3)
identify(short,long,labels=Monkey)  #  Label the outliers; press Esc when done
legend(52,54,legend=c("Control","Hippocampus Blocked"), pch=c(21,22), 
  pt.bg=c("green","orange"), pt.cex=c(2.5,2.5), pt.lwd=c(3,3), cex=1.5)

  
## ADVANCED: RANDOMIZATION TEST FOR EQUALITY OF BIVARIATE RESPONSES  
myAnova <- anova(myLm2, myLm1, test="Hotelling") #Hotelling Test for Treatment 
myAnova$approx[2]        #[1] 12.32109:  F-statistic 
numRep <- 50 # Number of random regroupings (change to 50,000)
FStats <- rep(0,numRep)  # Initialize a variable for storing the F-statistics
myLmReduced <- lm(cbind(short,long) ~ 1)# Fit the reduced model once
for (rep in 1:numRep) {  # Do the following commands in parenthese num.rep times
  randomGroup <- rep("Group1",18) # Set randomGroup initially to all "Group1" 
  randomGroup[sample(1:18,7)]  <- "Group2" # Change 7 at random to "Group2"
  randomGroup <- factor(randomGroup)  # Make the character variable a factor
  myLmFull <- lm(cbind(short,long) ~ randomGroup)  # Fit full model
  myAnova2  <- anova(myLmReduced, myLmFull, test="Hotelling") # Hotelling's test 
  FStats[rep] <- myAnova2$approx[2]   # Store the F-statistic 
}  # If numRep = 50,000, go get a cup of coffee while you wait for this.
hist(FStats, main="Approx. Randomizatin Dist of F-stat if No Treatment Effect")  
abline(v=12.32109)    # Show actually observed Hotelling F-statistic
pValue <- sum(FStats >= 12.32109)/numRep
pValue  # Approximate randomization test p-value (no distributional assumptions)

detach(case1601)



