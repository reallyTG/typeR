library(Sleuth3)


### Name: case0402
### Title: Cognitive Load
### Aliases: case0402
### Keywords: datasets

### ** Examples

str(case0402) # level 1 of Treatment is "Conventional" (1st alphabetically)
attach(case0402)  

boxplot(Time ~ Treatment) 
median(Time[Treatment=="Conventional"])-median(Time[Treatment=="Modified"])  
  
wilcox.test(Time ~ Treatment, exact=FALSE, correct=TRUE, 
  alternative="greater")  # Rank-sum test; alternative: group 1 is greater
wilcox.test(Time ~ Treatment, exact=FALSE, correct=TRUE, 
  alternative="two.sided", conf.int=TRUE)  # Use 2-sided to get confidence int.  
        
## DOT PLOTS FOR PRESENTATION 
xTreatment    <- ifelse(Treatment=="Conventional",1,2) # Make numerical values  
myPointCode   <- ifelse(Censored==0,21,24)  
plot(Time ~ jitter(xTreatment,.2),   # Jitter the 1's and 2's for visibility
     ylab="Completion Time (Sec.)",  xlab="Training Method (jittered)",
     main="Test Completion Times from Cognitive Load Experiment",
     axes=FALSE, pch=myPointCode, bg="green", cex=2, xlim=c(.5,2.5) )  
axis(2) # Draw y-axis as usual
axis(1, tick=FALSE,  at=c(1,2),  # Draw x-axis without ticks
  labels=c("Conventional (n=14 Students)","Modified (n=14 Students)") )  
legend(1.5,300, legend=c("Did not Complete in 300 sec","Completed in 300 sec."),
       pch=c(24,21), pt.cex=2, pt.bg="green")  
  
detach(case0402) 



