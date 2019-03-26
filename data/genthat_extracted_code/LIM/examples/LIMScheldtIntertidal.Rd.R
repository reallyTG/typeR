library(LIM)


### Name: LIMScheldtIntertidal
### Title: Linear inverse model specification for the Schelde Intertidal
###   flat food web
### Aliases: LIMScheldtIntertidal
### Keywords: datasets

### ** Examples

ScheldtIntertidal <- Flowmatrix(LIMScheldtIntertidal)
plotweb(ScheldtIntertidal, main = "Scheldt intertidal flat food web",
        sub = "mgC/m2/day")
Plotranges(LIMScheldtIntertidal, lab.cex = 0.7,
        main = "Scheldt intertidal flat food web, Flowranges")
Plotranges(LIMScheldtIntertidal, type = "V", lab.cex = 0.7,
        main = "Scheldt intertidal flat food web, Variable ranges")



