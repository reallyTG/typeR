library(SetMethods)


### Name: skew.check
### Title: Function for checking how skewed sets are.
### Aliases: skew.check
### Keywords: QCA

### ** Examples

# Import your data. For example:

data(SCHF)

# Check skewness for the entire dataframe:

skew.check(SCHF)

# Check skewness for the column "EMP" in the dataframe:

skew.check(SCHF$EMP)

# Check skewness for the 5th column of the dataframe:

skew.check(SCHF[,5])




