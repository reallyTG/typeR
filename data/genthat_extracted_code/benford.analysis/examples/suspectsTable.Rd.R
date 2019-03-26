library(benford.analysis)


### Name: suspectsTable
### Title: Shows the first digits ordered by the mains discrepancies from
###   Benford's Law
### Aliases: suspectsTable

### ** Examples

data(corporate.payment) #gets data 
cp <- benford(corporate.payment$Amount) #generates benford object
suspectsTable(cp) 



