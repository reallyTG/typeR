library(MC2toPath)


### Name: SaveFireAreaFracs
### Title: Save Fire Area Fractions
### Aliases: SaveFireAreaFracs
### Keywords: IO file

### ** Examples

## The function is currently defined as
function (vegChangesLocal, fireFracsLocal) 
{
    srcDataFile = vegChangesLocal[[1]]
    years = vegChangesLocal[[2]]
    nYr = length(years)
    VTs = vegChangesLocal[[3]]
    nVT = length(VTs)
    vegFracs = vegChangesLocal[[4]]
    outFile = "fireAreaFracs.csv"
    fireAreaFracs = matrix(0, nrow = nYr, ncol = nVT)
    cat(srcDataFile, file = outFile, append = FALSE)
    cat("\n", file = outFile, append = TRUE)
    cat("year", file = outFile, append = TRUE)
    for (vtNdx in 1:nVT) cat(c(", ", VTs[vtNdx]), file = outFile, 
        append = TRUE)
    cat("\n", file = outFile, append = TRUE)
    for (yrNdx in 1:nYr) {
        cat(years[yrNdx], file = outFile, append = TRUE)
        for (vtNdx in 1:nVT) {
            fireAreaFracs[yrNdx, vtNdx] = vegFracs[vtNdx, yrNdx] * 
                fireFracsLocal[yrNdx, vtNdx]
            cat(c(", ", fireAreaFracs[yrNdx, vtNdx]), file = outFile, 
                append = TRUE)
        }
        cat("\n", file = outFile, append = TRUE)
    }
    return(fireAreaFracs)
  }



