library(oii)


### Name: oii.xtab
### Title: A cross-tabulation with measures of association
### Aliases: oii.xtab

### ** Examples

#Create var1 as 200 A's, B's, and C's
var1<-sample(LETTERS[1:3],size=200,replace=TRUE)
#Create var2 as 200 numbers in the range 1 to 4
var2<-sample(1:4,size=200,replace=TRUE)

#Print a simple 2-way table of var1 and var2
oii.xtab(var1,var2)

#Print the row and column percents
oii.xtab(var1,var2,row=TRUE,col=TRUE)

#Print measures of association statistics
oii.xtab(var1,var2,stats=TRUE)

#If the variables are part of a data.frame
my.data.frame<-data.frame(var1,var2)
#We can use the $ to get the variables
oii.xtab(my.data.frame$var1,my.data.frame$var2)
#or use the with(...) command to save some typing
with(my.data.frame,oii.xtab(var1,var2))

#Three-way tables are also possible
#Create var3 as 200 "I"'s, "II"'s, and "III"'s
var3<-sample(c("I","II","III"),size=200,replace=TRUE)
oii.xtab(var1,var2,var3)

#We can also pass in a data.frame directly as the first argument
my.data.frame<-data.frame(var1,var2,var3)
oii.xtab(my.data.frame,stats=TRUE)
#The variables in the data.frame are used in order;
#so, sometimes it is useful to re-order them. For example,
oii.xtab(my.data.frame[,c("var3","var1","var2")],stats=TRUE)
#Of course, it is also possible to pass in the variables one 
#at a time or use with(...) as shown above.




