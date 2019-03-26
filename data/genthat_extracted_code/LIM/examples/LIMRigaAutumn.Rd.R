library(LIM)


### Name: LIMRigaAutumn
### Title: Linear inverse model specification for the Gulf of Riga *autumn*
###   planktonic food web
### Aliases: LIMRigaAutumn
### Keywords: datasets

### ** Examples

rigaAutumn <- Flowmatrix(LIMRigaAutumn)
plotweb(rigaAutumn, main = "Gulf of Riga planktonic food web, autumn",
        sub = "mgC/m3/day")
# ranges of flows
Plotranges(LIMRigaAutumn, lab.cex = 0.7, xlab = "mgC/m3/d",
        main = "Gulf of Riga planktonic food web, autumn, Flowranges")
# ranges of variables
Plotranges(LIMRigaAutumn, type="V", lab.cex = 0.7, xlab = "mgC/m3/d",
        main = "Gulf of Riga planktonic food web, autumn, variables")



