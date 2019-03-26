library(SmartEDA)


### Name: ExpCatStat
### Title: Function provides summary statistics for all character or
###   categorical columns in the dataframe
### Aliases: ExpCatStat

### ** Examples

# Example 1
## Read mtcars data
# Target variable "am" - Transmission (0 = automatic, 1 = manual)
# Summary statistics
ExpCatStat(mtcars,Target="am",Label="Transmission",result = "Stat",clim=10,nlim=5,Pclass=1)
# Inforamtion value for categorical Independent variables
ExpCatStat(mtcars,Target="am",Label="Transmission",result = "IV",clim=10,nlim=5,Pclass=1)



