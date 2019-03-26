library(FitAR)


### Name: cts
### Title: Concantenate Time Series
### Aliases: cts
### Keywords: ts

### ** Examples

#Example 1
#Compare cts and c
#In the current version of R (2.6), they produce different results
z1<-window(lynx,end=1900)
z2<-window(lynx,start=1901)
z<-cts(z1,z2)
y<-c(z1,z2)

#See also Example 2 in predict.FitAR documentation

#Example 3. 
#Note tsp attribute of second argument is ignored but a warning is given if it is present
# and not aligned with first argument's attribute.
x <- ts(1:3)
z <- ts(6:7, start = 7)
cts(x,z) #warning given
y <- ts(4:5, start = 4)
cts(x,y) #no warning needed in this example.




