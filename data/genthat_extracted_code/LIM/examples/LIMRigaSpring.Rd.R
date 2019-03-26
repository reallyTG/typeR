library(LIM)


### Name: LIMRigaSpring
### Title: Linear inverse model specification for the Gulf of Riga *spring*
###   planktonic food web.
### Aliases: LIMRigaSpring
### Keywords: datasets

### ** Examples

rigaSpring <- Flowmatrix(LIMRigaSpring)
plotweb(rigaSpring, main = "Gulf of Riga planktonic food web, spring",
        sub = "mgC/m3/day")
Plotranges(LIMRigaSpring, lab.cex = 0.7,
        main = "Gulf of Riga planktonic food web, spring, Flowranges")
Plotranges(LIMRigaSpring, type = "V", lab.cex = 0.7,
        main = "Gulf of Riga planktonic food web, spring, Variable ranges")



