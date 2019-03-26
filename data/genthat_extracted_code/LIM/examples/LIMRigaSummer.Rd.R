library(LIM)


### Name: LIMRigaSummer
### Title: Linear inverse model specification for the Gulf of Riga *summer*
###   planktonic food web.
### Aliases: LIMRigaSummer
### Keywords: datasets

### ** Examples

rigaSummer <- Flowmatrix(LIMRigaSummer)
plotweb(rigaSummer, sub = "mgC/m3/day",
        main = "Gulf of Riga planktonic food web, summer")
Plotranges(LIMRigaSummer, type = "V", lab.cex = 0.7,
        main = "Gulf of Riga planktonic food web, summer, Variable ranges")


