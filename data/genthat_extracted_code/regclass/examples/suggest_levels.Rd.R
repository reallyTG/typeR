library(regclass)


### Name: suggest_levels
### Title: Combining levels of a categorical variable
### Aliases: suggest_levels

### ** Examples

 
 
  data(DONOR)
  
  #Can levels of URBANICITY be treated the same with regards to probability of donation?
  #Analysis suggests yes (all levels in one)
  suggest_levels(Donate~URBANICITY,data=DONOR)

  #Can levels of URBANICITY be treated the same with regards to donation amount?
  #Analysis suggests yes, but perhaps there are four "effective levels"
  
  suggest_levels(Donation.Amount~URBANICITY,data=DONOR)
  SL <- suggest_levels(Donation.Amount~URBANICITY,data=DONOR,target=4,recode=TRUE)
	SL$Conversion

	#Add a column to the DONOR dataframe that contains these new cluster identities
  DONOR$newCLUSTER_CODE <- SL$newlevels
	 


