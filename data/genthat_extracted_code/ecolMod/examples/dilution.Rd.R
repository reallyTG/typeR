library(ecolMod)


### Name: dilution
### Title: Draws dilution culture setup
### Aliases: dilution
### Keywords: aplot

### ** Examples
par(mar = c(0, 0, 0, 0))                         
dd <- dilution(main = c("Stock", "Stirred tank"), int = "Flow,Q")
text(dd$p2[1], dd$p2[2], "Ain", font = 2)
text(dd$p1[1], dd$p1[2]+0.03, "Volume V", font = 2)
text(dd$p1[1], dd$p1[2]-0.03, "[A]", font = 2)


