library(regclass)


### Name: choose_order
### Title: Choosing order of a polynomial model
### Aliases: choose.order choose_order

### ** Examples

  data(BULLDOZER)
	M <- lm(SalePrice~YearMade,data=BULLDOZER)
  #Unsorted list, messing with plot options to make it look alright
	choose_order(M,pch=20,cex=.3)
	
	#Sort by R2adj.  A 10th order polynomial is highest, but this seems overly complex
	choose_order(M,max.order=10,sort=TRUE)

	#Sort by AICc.  4th order is lowest, but 2nd order is simpler and within 2 of lowest
	choose_order(M,max.order=10,sort="aic")

	 


