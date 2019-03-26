library(paleotree)


### Name: footeValues
### Title: Calculates Values for Foote's Inverse Survivorship Analyses
### Aliases: footeValues

### ** Examples

#very simple example with three intervals, same value for all parameters

#example rates (for the most part)
rate <- rep(0.1,3)                  
#all continuous
footeValues(rate,rate,rate)	
#origination pulsed
footeValues(rate,rate,rate,p_cont = FALSE)		 
#extinction pulsed
footeValues(rate,rate,rate,q_cont = FALSE) 	 
#all pulsed
footeValues(rate,rate,rate,p_cont = FALSE,q_cont = FALSE) 



