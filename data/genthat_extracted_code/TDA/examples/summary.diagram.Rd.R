library(TDA)


### Name: summary.diagram
### Title: 'print' and 'summary' for 'diagram'
### Aliases: summary.diagram print.summary.diagram print.diagram

### ** Examples

# Generate data from 2 circles
XX1 <- circleUnif(30)
XX2 <- circleUnif(30, r = 2) + 3
XX <- rbind(XX1, XX2)

DiagLim <- 5         # limit of the filtration
maxdimension <- 1    # computes betti0 and betti1

Diag <- ripsDiag(XX, maxdimension, DiagLim, printProgress = TRUE)

print(Diag[["diagram"]])
print(summary(Diag[["diagram"]]))



