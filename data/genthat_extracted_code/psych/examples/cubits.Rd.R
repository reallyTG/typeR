library(psych)


### Name: cubits
### Title: Galton's example of the relationship between height and 'cubit'
###   or forearm length
### Aliases: cubits
### Keywords: datasets

### ** Examples

data(cubits)
cubits
heights <- table2df(cubits,labs = c("height","cubit"))
ellipses(heights,n=1,main="Galton's co-relation data set")
ellipses(jitter(heights$height,3),jitter(heights$cubit,3),pch=".",
     main="Galton's co-relation data set",xlab="height",
     ylab="Forearm (cubit)") #add in some noise to see the points
pairs.panels(heights,jiggle=TRUE,main="Galton's cubits data set")



