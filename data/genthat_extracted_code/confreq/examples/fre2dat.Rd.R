library(confreq)


### Name: fre2dat
### Title: pattern frequency to dataset conversion
### Aliases: fre2dat

### ** Examples

#######################################
data(LienertLSD)# loading example pattern frequencies table
fre2dat(LienertLSD)# coverting it into a (data) matrix
# for a matrix without colnames
colnames(LienertLSD)<-NULL # first removing the colnames
fre2dat(LienertLSD) # conversion with automatic new colnames
# requesting a data.frame using factor levels 
fre2dat(LienertLSD,fact=TRUE,labels=c("yes","no"))



