library(multilevel)


### Name: mult.make.univ
### Title: Convert two or more variables from multivariate to univariate
###   form
### Aliases: mult.make.univ
### Keywords: manip

### ** Examples

data(univbct) #a dataframe in univariate form for job sat
TEMP<-univbct[3*1:495,c(22,1:17)]  #convert back to multivariate form
names(TEMP) #use the column names to find the column numbers

#Create a list of DV's - each DV should have the same number of obs
dvlist <- list(c(10,13,16),c(11,14,17))
names(dvlist) <- c("JOBSAT","COMMIT") #names for univariate output

#Transform the data into univariate form with multiple level-1 variables
mldata <- mult.make.univ(x=TEMP,dvlist=dvlist)  



