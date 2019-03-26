library(multilevel)


### Name: make.univ
### Title: Convert data from multivariate to univariate form
### Aliases: make.univ
### Keywords: manip

### ** Examples

data(univbct)  #a dataframe in univariate form for job satisfaction
TEMP<-univbct[3*1:495,c(22,1:17)]  #convert back to multivariate form

#Transform data to univariate form
TEMP2<-make.univ(x=TEMP,dvs=TEMP[,c(10,13,16)]) 

#Same as above, but renaming repeated variable
TEMP3<-make.univ(x=TEMP,dvs=TEMP[,c(10,13,16)],outname="JOBSAT")  



