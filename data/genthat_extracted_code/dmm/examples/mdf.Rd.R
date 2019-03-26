library(dmm)


### Name: mdf
### Title: Prepare a dataframe for use with dmm function
### Aliases: mdf
### Keywords: manip

### ** Examples

library(dmm)

# prepare a multi-trait dataset from sheep.df
data(sheep.df)
# look at its structure
str(sheep.df)
# needs some work - Id, SId, DId are alphanumeric
#                 - Year is numeric and we want it as a factor
#                 - there are 3 traits (Cww,Diam,Bwt) to put into a trait matrix
sheep.mdf1 <- mdf(sheep.df,pedcols=c(1:3), factorcols=c(4:6), ycols=c(7:9),
             sexcode=c("M","F"))
# note the screen messages - it also had to add 2 base Id's for 2 of the dams
str(sheep.mdf1)
# so it returned a dataframe object with 44 observations
# and one of the columns is a matrix called 'Ymat'

# prepare a dataset requiring relationship matrices
sheep.mdf2 <- mdf(sheep.df,pedcols=c(1:3), factorcols=c(4:6), ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# note the screen messages - it now makes an object of class mdf
str(sheep.mdf2)
# so it returned a list object with 2 items
#    df - the dataframe
#   rel - a list of relationship matrices ( note those not requested are NULL)
#
 



