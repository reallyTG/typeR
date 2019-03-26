library(regclass)


### Name: mode_factor
### Title: Find the mode of a categorical variable
### Aliases: mode_factor

### ** Examples

	data(EX6.CLICK)
  mode_factor(EX6.CLICK$DeviceModel)
  
  #To see how often it appears try sorting a table
  sort( table(EX6.CLICK$DeviceModel),decreasing=TRUE )
  
  x <- c( rep(letters[1:4],5), "e", "f" )  #multimodel
  mode_factor(x)

  



