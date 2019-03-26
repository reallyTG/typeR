library(SetMethods)


### Name: ambig.cases
### Title: Function for identifying cases with 0.5 fuzzy-set values.
### Aliases: ambig.cases
### Keywords: QCA

### ** Examples

# Import your data. For example:

data(SCHF)

# Get cases with 0.5 in the entire dataframe:

ambig.cases(SCHF)

# Get cases with 0.5 in the column "EMP" in the dataframe:

ambig.cases(SCHF$EMP)

# Get cases with 0.5 in the 7th column of the dataframe:

ambig.cases(SCHF[,7])




