library(benford.analysis)


### Name: benford.analysis
### Title: Benford Analysis for data validation and forensic analytics
### Aliases: benford.analysis benford.analysis-package

### ** Examples

data(corporate.payment) #gets data
cp <- benford(corporate.payment$Amount, 2, sign="both") #generates benford object
cp #prints 
plot(cp) #plots

head(suspectsTable(cp),10) #prints the digits by decreasing order of discrepancies

#gets observations of the 2 most suspicious groups
suspects <- getSuspects(cp, corporate.payment, how.many=2) 

duplicatesTable(cp) #prints the duplicates by decreasing order

#gets the observations of the 2 values with most duplicates
duplicates <- getDuplicates(cp, corporate.payment,how.many=2) 

MAD(cp) #gets the Mean Absolute Deviation

chisq(cp) #gets the Chi-squared test

#gets observations starting with 50 or 99
digits_50_and_99 <- getDigits(cp, corporate.payment, digits=c(50, 99)) 




