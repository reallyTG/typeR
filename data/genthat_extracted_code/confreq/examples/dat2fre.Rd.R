library(confreq)


### Name: dat2fre
### Title: dataset to pattern frequency conversion
### Aliases: dat2fre

### ** Examples

#######################################
data(suicide)# loading data in data frame (702 cases) representation 
dat2fre(suicide) # converting it into a pattern frequencies table

########### 
#######################################
data(LienertLSD)# loading example pattern frequencies table ..
test<-fre2dat(LienertLSD)# and coverting it into a simple (data) matrix
test<-test[sample(c(1:65),65),] # making a messy order 
############
dat2fre(test) # making a proper ordered pattern frequencies table again
##### try it with a data.frame too!
#######################################



