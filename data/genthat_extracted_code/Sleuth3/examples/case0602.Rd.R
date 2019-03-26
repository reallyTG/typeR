library(Sleuth3)


### Name: case0602
### Title: Mate Preference of Platyfish
### Aliases: case0602
### Keywords: datasets

### ** Examples

str(case0602)  
attach(case0602)   

## EXPLORATION
plot(Percentage ~ Length,  
  xlab="Length of the Two Males",  
  ylab="Percentage of Time Female Spent with Yellow-Sword Male",  
  main="Percentage of Time Spent with Yellow Rather than Transparent Sword Male") 
abline(h=50)    # Draw a horizontal line at 50% (i.e. the "no preference" line)  
myAov  <- aov(Percentage ~ Pair)  
plot(myAov, which=1) # Resdiual plot  
summary(myAov)  

# Explore possibility of linear effect, as in Display 6.5 
myAov2        <- aov(Percentage ~ Pair - 1)  # Show the estimated means.
myContrast    <- rbind(c(5, -3, 1, 3, -9, 3))  
if(require(multcomp)){   # Use the multcomp library  
  myComparison  <- glht(myAov2, linfct=myContrast)    
  summary(myComparison, test=adjusted("none")) 
}


# Simpler exploration of linear effect, via regression (Ch. 7)
myLm          <- lm(Percentage ~ Length)   
summary(myLm)            

# ONE-SAMPLE t-TEST THAT MEAN PERCENTAGE = 50%, IGNORING MALE PAIR EFFECT
t.test(Percentage, mu=50, alternative="greater") # Get 1-sided p-value
t.test(Percentage, alternative="two.sided")  # Get C.I.

## SCATTERPLOT FOR PRESENTATION
plot(Percentage ~ Length,  
    xlab="Length of the Two Males (mm)",   
    ylab="Percentage of Time Female Spent with Yellow-Sword Male", 
    main="Female Preference for Yellow Rather than Transparent Sword Male",  
    pch=21, lwd=2, bg="green", cex=1.5 )  
abline(h=50,lty=2,col="blue",lwd=2)  
text(29.5,52,"50% (no preference)", col="blue")   
   
detach(case0602) 



