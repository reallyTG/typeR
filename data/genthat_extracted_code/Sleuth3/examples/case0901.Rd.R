library(Sleuth3)


### Name: case0901
### Title: Effects of Light on Meadowfoam Flowering
### Aliases: case0901
### Keywords: datasets

### ** Examples

str(case0901)
attach(case0901)

## EXPLORATION
plot(Flowers ~ Intensity, pch=ifelse(Time ==1, 19, 21))
myLm <- lm(Flowers ~ Intensity + factor(Time) + Intensity:factor(Time)) 
plot(myLm, which=1) 
summary(myLm)  # Note p-value for interaction term

# INFERENCE
myLm2 <- lm(Flowers ~ Intensity + factor(Time)) 
summary(myLm2)         
confint(myLm2)         

# DISPLAY FOR PRESENTATION
plot(Flowers ~ jitter(Intensity,.3),   
  xlab=expression("Light Intensity ("*mu*"mol/"*m^2*"/sec)"), # Include symbols
  ylab="Average Number of Flowers per Plant",
  main="Effect of Light Intensity and Timing on Meadowfoam Flowering",
  pch=ifelse(Time ==1, 21, 22), bg=ifelse(Time==1, "orange","green"),
  cex=1.7, lwd=2)          
beta <- myLm2$coef  
abline(beta[1],beta[2],lwd=2, lty=2) 
abline(beta[1]+beta[3],beta[2],lwd=2,lty=3) 
legend(700,79,c("Early Start","Late Start"),  
  pch=c(22,21),lwd=2,pt.bg=c("green","orange"),pt.cex=1.7,lty=c(3,2))

detach(case0901)



