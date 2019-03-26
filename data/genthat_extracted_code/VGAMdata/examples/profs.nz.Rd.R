library(VGAMdata)


### Name: profs.nz
### Title: Professors of Statistics in New Zealand
### Aliases: profs.nz
### Keywords: datasets

### ** Examples

profs.nz
profs.nz[order(with(profs.nz, pubtotal), decreasing = TRUE), ]
## Not run: 
##D plot(pub1stAuthor / pubtotal ~ pubtotal,
##D      main = "Professors of Statistics in NZ",
##D      xlab = "Number of publications in MathSciNet",
##D      ylab = "Proportion of first-authored papers",
##D      data = profs.nz, col = "blue", las = 1, type = "n")
##D with(profs.nz, text(pubtotal, y = pub1stAuthor / pubtotal,
##D      labels = initials, col = "blue", las = 1))
## End(Not run)



