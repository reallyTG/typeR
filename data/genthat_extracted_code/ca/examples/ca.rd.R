library(ca)


### Name: ca
### Title: Simple correspondence analysis
### Aliases: ca ca.matrix ca.data.frame ca.formula ca.table ca.xtabs
###   ca.default
### Keywords: multivariate

### ** Examples
 
data("author")
ca(author)
plot(ca(author))

# table method
haireye <- margin.table(HairEyeColor, 1:2)
haireye.ca <- ca(haireye)
haireye.ca
plot(haireye.ca)
# some plot options
plot(haireye.ca, lines=TRUE)
plot(haireye.ca, arrows=c(TRUE, FALSE))

 


