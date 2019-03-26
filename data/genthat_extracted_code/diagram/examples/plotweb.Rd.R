library(diagram)


### Name: plotweb
### Title: plots a web
### Aliases: plotweb
### Keywords: aplot

### ** Examples

plotweb(Rigaweb, main = "Gulf of Riga food web",
        sub = "mgC/m3/d", val = TRUE)

ArrCol <- Rigaweb
ArrCol[] <- "black"
ArrCol[,"Sedimentation"] <- "green"

plotweb(Rigaweb, main = "Gulf of Riga food web",
        sub = "mgC/m3/d", val = FALSE, arr.col = ArrCol)

plotweb(diag(20), main = "plotweb")



