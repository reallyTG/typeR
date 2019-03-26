library(lordif)


### Name: lordif-package
### Title: Logistic Ordinal Regression Differential Item Functioning using
###   IRT
### Aliases: lordif-package
### Keywords: package

### ** Examples

##load PROMIS Anxiety sample data (n=766)
## Not run: data(Anxiety)
##age : 0=younger than 65 or 1=65 or older
##gender: 0=Male or 1=Female
##education: 0=some college or higher 1=high school or lower
##run age-related DIF on all 29 items (takes about a minute)
## Not run: age.dif <- lordif(Anxiety[paste("R",1:29,sep="")], Anxiety$age) 
##with sample weights - produces the same results as above, i.e., with equal weights
## Not run: age.dif <- lordif(Anxiety[paste("R",1:29,sep="")], Anxiety$age, weights=rep(1/766,766)) 
##print output
## Not run: print(age.dif)
##print extended output
## Not run: summary(age.dif)
##generate plots for DIF items (reference group: <65)
## Not run: plot(age.dif,labels=c("Younger","Older"))
##run Monte Carlo simulations for threshold values
##this may take several minutes
## Not run: age.dif.MC<-montecarlo(age.dif,alpha=0.05,nr=100)
##print output
## Not run: print(age.dif.MC)
##print extended output
## Not run: summary(age.dif.MC)
##generate plots for Monte Carlo threshold values
## Not run: plot(age.dif.MC)
##run DFIT analysis
## Not run: age.dif.DFIT<-DFIT(age.dif)



