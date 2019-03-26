library(LIM)


### Name: LIMTakapoto
### Title: Linear inverse model specification for the Takapoto atoll
###   planktonic food web.
### Aliases: LIMTakapoto
### Keywords: datasets

### ** Examples
Takapoto <- Flowmatrix(LIMTakapoto)
plotweb(Takapoto, main="Takapoto atoll planktonic food web",
        sub = "mgC/m2/day", lab.size = 1)
# some ranges extend to infinity - they are marked with "*"
Plotranges(LIMTakapoto, lab.cex = 0.7, 
        sub = "*=unbounded", xlab = "mgC/m2/d",
        main = "Takapoto atoll planktonic food web, Flowranges")
# ranges of variables, exclude first
Plotranges(LIMTakapoto, type = "V", lab.cex = 0.7, 
        index = 2:23, xlab = "mgC/m2/d",
        main = "Takapoto atoll planktonic food web, Variable ranges")



