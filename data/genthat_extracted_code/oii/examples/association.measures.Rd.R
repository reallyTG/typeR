library(oii)


### Name: association.measures
### Title: Measures of association
### Aliases: association.measures

### ** Examples

#Create var1 as 200 A's, B's, and C's
var1<-sample(LETTERS[1:3],size=200,replace=TRUE)
#Create var2 as 200 numbers in the range 1 to 4
var2<-sample(1:4,size=200,replace=TRUE)

#Print a simple cross tab of var1 and var2
association.measures(var1,var2)



