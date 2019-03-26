library(Sleuth3)


### Name: case1901
### Title: Sex Role Sterotypes and Personnel Decisions
### Aliases: case1901
### Keywords: datasets

### ** Examples

str(case1901)
attach(case1901)
   
## INFERENCE
myTable             <- cbind(Promoted,NotPromoted)    
row.names(myTable)  <- Gender    
myTable   
fisher.test(myTable, alternative="greater")  
  # Alternative: that odds of Promotion in first row (Males) are greater.
fisher.test(myTable)  # Use 2-sided to get confidence interval for odds ratio
prop.test(myTable) # Compare two binomial proportions


## GRAPHICAL DISPLAY FOR PRESENTATION
myTable
#         Promoted NotPromoted
#Male         21           3
#Female       14          10
prop.test(21,(21+3)) # Est = .875; CI = .665 to .967  
prop.test(14,(14+10))# Est = .583; CI = .369 to .772  

pHat   <- c(0.875,0.583)       
lower95 <- c(0.665, 0.369)
upper95 <- c(0.967, 0.772)
if(require(Hmisc)) {      # Use Hmisc library
  myObj<- Cbind(pHat,lower95,upper95) # Cbind: a form of cbind needed for Dotplot 
  Dotplot(Gender ~ myObj,  
  xlab="Probability of Promotion Based on Applicant File (and 95% Confidence Intervals)",
    ylab="Gender Listed in Applicant File", ylim=c(.5,2.5), cex=2)
}

detach(case1901)



