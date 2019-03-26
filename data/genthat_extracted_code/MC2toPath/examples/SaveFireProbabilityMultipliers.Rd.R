library(MC2toPath)


### Name: SaveFireProbabilityMultipliers
### Title: Save fire probability multipliers as text files
### Aliases: SaveFireProbabilityMultipliers
### Keywords: IO file

### ** Examples

## The function is currently defined as
function (infile, baseCalibration, vt2pvt_LUT) 
{
    fP = open.nc(infile)
    VTYPE = var.get.nc(fP, "VTYPE")
    PART_BURN = var.get.nc(fP, "PART_BURN")
    YEAR = var.get.nc(fP, "year")
    nYrs = dim(VTYPE)[3]
    nVTall = length(VTnames(baseCalibration))
    vts2keepLUTndx = rep(0, times = nVTall)
    nStrata = length(vt2pvt_LUT$Stratum)
    for (i in 1:nStrata) {
        vts2keepLUTndx[vt2pvt_LUT$VT[i]] = i
    }
    vtCounts = matrix(nrow = nVTall, ncol = nYrs)
    vtFracs = matrix(nrow = nVTall, ncol = nYrs)
    fireFracs = matrix(nrow = nVTall, ncol = nYrs)
    fireFile = "fireFracs.csv"
    cat("\nFraction of cells in each veg type with simulated fires in each year\n", 
        file = fireFile, append = FALSE)
    cat(infile, file = fireFile, append = TRUE)
    cat("\n\n", file = fireFile, append = TRUE)
    totFireFracThisYr = c(rep(0, nYrs))
    for (yr in 1:nYrs) {
        fireThisYr = c(rep(0, nVTall))
        vtCounts[, yr] = tabulate(VTYPE[, , yr], nVTall)
        nCellsActive = sum(vtCounts[, yr])
        if (yr > 1) 
            stopifnot(nCellsActive == prev_nCellsActive)
        prev_nCellsActive = nCellsActive
        for (i in 1:dim(VTYPE)[1]) {
            for (j in 1:dim(VTYPE)[2]) {
                vt = VTYPE[i, j, yr]
                if (!is.na(vt) && PART_BURN[i, j, yr] > 0) {
                  stopifnot(1 <= vt && vt <= nVTall)
                  fireThisYr[vt] <- fireThisYr[vt] + 1
                }
            }
        }
        totFireFracThisYr[yr] = sum(fireThisYr)/nCellsActive
        print(c(YEAR[yr], totFireFracThisYr[yr]))
        for (vt in 1:nVTall) {
            if (vtCounts[vt, yr] > 0) 
                fireFracs[vt, yr] = fireThisYr[vt]/vtCounts[vt, 
                  yr]
            else fireFracs[vt, yr] = 0
        }
    }
    VTYPEf = factor(VTYPE, 1:nVTall, VTnames(baseCalibration))
    counts = tabulate(VTYPEf)
    VTofCol = c()
    nameOfCol = c()
    col = 0
    for (vt in 1:length(counts)) if (vts2keepLUTndx[vt] > 0) {
        VTofCol = c(VTofCol, vt)
        nameOfCol = c(nameOfCol, VTnames(baseCalibration)[vt])
        col = col + 1
    }
    nVTactive = length(VTofCol)
    stopifnot(nVTactive > 0)
    minFireFracs = matrix(nrow = nYrs, ncol = nVTactive)
    for (i in 1:nVTactive) minFireFracs[, i] = fireFracs[VTofCol[i], 
        ]
    cat("cells, year", file = fireFile, append = TRUE)
    cat(", ", file = fireFile, append = TRUE)
    cat(nameOfCol, file = fireFile, sep = ", ", append = TRUE)
    cat(", ", file = fireFile, append = TRUE)
    cat("all", file = fireFile, append = TRUE)
    cat("\n", file = fireFile, append = TRUE)
    for (yr in 1:nYrs) {
        cat(nCellsActive, file = fireFile, sep = ", ", append = TRUE)
        cat(", ", file = fireFile, append = TRUE)
        cat(YEAR[yr], file = fireFile, sep = ", ", append = TRUE)
        cat(", ", file = fireFile, append = TRUE)
        cat(minFireFracs[yr, ], file = fireFile, sep = ", ", 
            append = TRUE)
        cat(", ", file = fireFile, append = TRUE)
        cat(totFireFracThisYr[yr], file = fireFile, append = TRUE)
        cat("\n", file = fireFile, append = TRUE)
    }
    years = YEAR
    VTs = VTofCol
    nVT = length(VTs)
    nYrs = length(YEAR)
    cat(c(nVT, nVTactive, nYrs, length(VTofCol), dim(minFireFracs), 
        VTofCol, "\n"))
    multiplierFile = "fireProbabilityMultipliers.txt"
    transitionTypes = c("WFNL", "WFMS", "WFSR")
    cat("\nMean fire probability over all years for each stratum\n")
    cat("VTYPE, stratum, mean fire probability per year\n")
    cat(infile, file = multiplierFile, append = FALSE)
    cat("\n", file = multiplierFile, append = TRUE)
    cat("kSrc, VTs[kSrc], vts2keepLUTndx[VTs[kSrc]], 
            levels(vt2pvt_LUT$Stratum)[vt2pvt_LUT$Stratum[vts2keepLUTndx[VTs[kSrc]]]], 
            meanFireProbability\n")
    for (kSrc in 1:nVTactive) {
        if (vts2keepLUTndx[VTs[kSrc]] < 1) 
            next
        stratum = levels(vt2pvt_LUT$Stratum)[vt2pvt_LUT$Stratum[vts2keepLUTndx[VTs[kSrc]]]]
        meanFireProbability = mean(minFireFracs[, kSrc])
        cat(c(kSrc, VTs[kSrc], vts2keepLUTndx[VTs[kSrc]], stratum, 
            meanFireProbability, "\n"))
        for (ttNdx in 1:length(transitionTypes)) {
            transitionType = transitionTypes[ttNdx]
            for (yr in 1:nYrs) {
                if (meanFireProbability == 0) 
                  fireProbabilityMultiplier = 0
                else fireProbabilityMultiplier = minFireFracs[yr, 
                  kSrc]/meanFireProbability
                outLine = paste(c(stratum, "\t\t", yr, "\tTemporal\t", 
                  transitionType, "\t", fireProbabilityMultiplier), 
                  collapse = "")
                cat(outLine, file = multiplierFile, append = TRUE)
                cat("\n", file = multiplierFile, append = TRUE)
            }
        }
    }
    cat(c(infile, baseCalibration, "SaveFireProbabilityMultipliers is finishing."))
    return(minFireFracs)
  }



