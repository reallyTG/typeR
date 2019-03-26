library(Sleuth3)


### Name: case0202
### Title: Anatomical Abnormalities Associated with Schizophrenia
### Aliases: case0202
### Keywords: datasets

### ** Examples

attach(case0202) 
str(case0202)  

diff <- Unaffected-Affected    
summary(diff)
t.test(diff) # Paired t-test is a one-sample t-test on differences 
t.test(Unaffected,Affected,pair=TRUE)  # Alternative coding for the same test 

boxplot(diff,       
  ylab="Difference in Hippocampus Volume (cubic cm)", 
  xlab="15 Sets of Twins, One Affected with Schizophrenia", 
  main="Hippocampus Difference: Unaffected Twin Minus Affected Twin") 
abline(h=0,lty=2)   # Draw a dashed (lty=2) horizontal line at 0    
  
## BOXPLOT FOR PRESENTATION:
boxplot(diff, 
  ylab="Difference in Hippocampus Volume (cubic cm)", 
  xlab="15 Sets of Twins, One Affected with Schizophrenia",
  main="Hippocampus Difference: Unaffected Minus Affected Twin",  
  col="green", boxlwd=2, medlwd=2, whisklty=1, whisklwd=2, 
  staplewex=.2, staplelwd=2, outlwd=2, outpch=21, outbg="green",
  outcex=1.5)      
abline(h=0,lty=2) 

detach(case0202)  



