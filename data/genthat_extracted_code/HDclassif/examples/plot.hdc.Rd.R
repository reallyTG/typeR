library(HDclassif)


### Name: plot.hdc
### Title: Cattell's Scree-Test for 'hdc' class objects.
### Aliases: plot.hdc
### Keywords: cattell hdda hddc clustering

### ** Examples

# Example 1 :
data(wine)
a <- wine[,-1]
z <- wine[,1]

prms1 <- hdda(a, z, model="AkBkQkDk", scaling=TRUE, d_select="bic")

#the plot related to the selection that has been done: BIC
plot(prms1)     

#it shows the plot of Cattell's scree-test, with a threshold of .3
plot(prms1,"Cattell",0.3)                         


prms2 <- hdda(a, z, model="AkBkQkD", scaling=TRUE, d_select="cattell")
#the plot related to the selection that has been done: Cattell's scree-test
plot(prms2) 
#the plot of the BIC
plot(prms2,"b") 




