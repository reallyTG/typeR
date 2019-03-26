library(regclass)


### Name: combine_rare_levels
### Title: Combines rare levels of a categorical variable
### Aliases: combine_rare_levels

### ** Examples

	data(EX6.CLICK)
	x <- EX6.CLICK[,15]
	table(x)
	
	#Combine all levels which appear 700 or fewer times (AA, CC, DD)
	y <- combine_rare_levels(x,700)
  table( y$values )
  
  #Combine all levels which appear 1350 or fewer times.  This forces BB (which
  #occurs 2422 times) into the Combined level since the three levels that appear
  #fewer than 1350 times do not appear more than 1350 times combined
	y <- combine_rare_levels(x,1350)
  table( y$values )




