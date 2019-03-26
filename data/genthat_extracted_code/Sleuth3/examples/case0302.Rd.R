library(Sleuth3)


### Name: case0302
### Title: Agent Orange
### Aliases: case0302
### Keywords: datasets

### ** Examples

attach(case0302)  
str(case0302)    # Note: Level 1 of Veteran is "Other" (first alphabeticall)

boxplot(Dioxin ~ Veteran)  

t.test(Dioxin ~ Veteran, var.equal=TRUE,
  alternative="less") # 1-sided t-test; alternative: group 1 mean is less  
t.test(Dioxin ~ Veteran, alternative="less", var.equal=TRUE, 
  subset=(Dioxin < 40)) # t-test on subset for which Dioxin < 40  
t.test(Dioxin ~ Veteran, alternative="less", var.equal=TRUE, 
  subset=(Dioxin < 20))    
t.test(Dioxin ~ Veteran, var.equal=TRUE) # 2-sided--to get confidence interval 

## HISTOGRAMS FOR PRESENTATION  
opar <- par(no.readonly=TRUE)  # Store device graphics parameter settings
par(mfrow=c(2,1), mar=c(3,3,1,1)) # 2 by 1 layout of plots; change margins    
myBreaks <- (0:46) - .5    # Make breaks for histogram bins  
hist(Dioxin[Veteran=="Other"], breaks=myBreaks, xlim=range(Dioxin),
  col="green", xlab="", ylab="", main="")     
text(10,25, 
  "Dioxin in 97 'Other' Veterans; Estimated mean =  4.19 ppt (95% CI: 3.72 to 4.65 ppt)",
  pos=4, cex=.75) # CI from 1-sample t-test & subset=(Veteran="Other")    
hist(Dioxin[Veteran=="Vietnam"],breaks=myBreaks,xlim=range(Dioxin),
  col="green", xlab="", ylab="", main="")   
text(10,160,
  "Dioxin in 646 Vietnam Veterans; Estimated mean =  4.26 ppt (95% CI: 4.06 to 4.64 ppt)",
  pos=4, cex=.75)   
text(13,145,"[Estimated Difference in Means: 0.07 ppt (95% CI: -0.63 to 0.48 ppt)]",
  pos=4, cex=.75)  
par(opar) # Restore previous graphics parameter settings
  
detach(case0302)    



