library(LIM)


### Name: Plotranges
### Title: Plots the minimum and maximum and central values
### Aliases: Plotranges Plotranges.double Plotranges.lim
###   Plotranges.character
### Keywords: hplot

### ** Examples

# The Takapoto food web.
# some ranges extend to infinity - they are marked with "*"
Plotranges(LIMTakapoto, lab.cex = 0.7, sub = "*=unbounded",
           xlab = "mgC/m2/d",  
           main = "Takapoto atoll planktonic food web, Flowranges")
# ranges of variables, exclude first variable
Plotranges(LIMTakapoto, type = "V", lab.cex = 0.7, 
           index = 2:23, xlab = "mgC/m2/d",
           main = "Takapoto atoll planktonic food web, Variable ranges")



