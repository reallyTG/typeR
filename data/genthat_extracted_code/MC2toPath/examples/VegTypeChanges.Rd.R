library(MC2toPath)


### Name: VegTypeChanges
### Title: Calculates transition rates.
### Aliases: VegTypeChanges
### Keywords: ~kwd1 manip

### ** Examples

## Please refer to the document "MakingThePATHmegamodel.pdf" in inst/doc.
## Step numbers given below refer to the step numbers in that document.	
	
## The function is currently defined as
function (tgtFile, tgtVarName, baseCalibration, dontskipVTs, 
    vt2pvtlut) 
{
    tgtP = open.nc(tgtFile)
    tgtLonInfo = dim.inq.nc(tgtP, "lon")
    tgtLonDimID = tgtLonInfo$id
    tgtLatInfo = dim.inq.nc(tgtP, "lat")
    tgtLatDimID = tgtLatInfo$id
    tgtYrInfo = dim.inq.nc(tgtP, "year")
    tgtYrDimID = tgtYrInfo$id
    years = var.get.nc(tgtP, "year")
    tgtVarInfo = var.inq.nc(tgtP, tgtVarName)
    tgtVarDimIds = tgtVarInfo$dimids
    stopifnot(length(tgtVarDimIds) == 3)
    stopifnot(tgtLonDimID == tgtVarDimIds[1])
    stopifnot(tgtLatDimID == tgtVarDimIds[2])
    stopifnot(tgtYrDimID == tgtVarDimIds[3])
    tgtVar = var.get.nc(tgtP, tgtVarName)
    tgtDim = dim(tgtVar)
    stopifnot(length(tgtDim) == 3)
    nCols = tgtDim[1]
    nRows = tgtDim[2]
    nYrs = tgtDim[3]
    stopifnot(nYrs >= 2)
    nCells = nCols * nRows
    dim(tgtVar) = c(nCells, nYrs)
    nVTall = length(VTnames(baseCalibration))
    vtCounts = array(0, c(nVTall, nYrs))
    for (yr in 1:nYrs) vtCounts[, yr] = tabulate(tgtVar[, yr], 
        nbins = nVTall)
    changePairs = array(FALSE, c(nVTall, nVTall))
    for (yr in 2:nYrs) {
        for (cell in 1:nCells) {
            vtPrev = tgtVar[cell, yr - 1]
            stopifnot((1 <= vtPrev && vtPrev <= nVTall) || is.na(vtPrev))
            vtCurr = tgtVar[cell, yr]
            stopifnot((1 <= vtCurr && vtCurr <= nVTall) || is.na(vtCurr))
            if (!is.na(vtPrev) && !is.na(vtCurr)) 
                changePairs[vtPrev, vtCurr] = changePairs[vtPrev, 
                  vtCurr] || (vtPrev != vtCurr)
        }
    }
    vts2omit = rep(TRUE, times = nVTall)
    for (vtPrev in 1:nVTall) {
        for (vtCurr in 1:nVTall) {
            if (changePairs[vtPrev, vtCurr]) 
                vts2omit[vtPrev] = FALSE
        }
    }
    rm(changePairs)
    if (length(dontskipVTs) > 0) {
        for (k in 1:length(dontskipVTs)) vts2omit[dontskipVTs[k]] = FALSE
    }
    changeCounts = array(0, c(nVTall, nVTall, nYrs - 1))
    changeFracs = array(0, c(nVTall, nVTall, nYrs - 1))
    for (yr in 2:nYrs) {
        for (cell in 1:nCells) {
            vtPrev = tgtVar[cell, yr - 1]
            vtCurr = tgtVar[cell, yr]
            if (!is.na(vtPrev) && 1 <= vtPrev && vtPrev <= nVTall && 
                !is.na(vtCurr) && 1 <= vtCurr && vtCurr <= nVTall) 
                changeCounts[vtPrev, vtCurr, yr - 1] = changeCounts[vtPrev, 
                  vtCurr, yr - 1] + 1
        }
        for (vtPrev in 1:nVTall) {
            for (vtCurr in 1:nVTall) {
                count = changeCounts[vtPrev, vtCurr, yr - 1]
                vtPrevTot = vtCounts[vtPrev, yr - 1]
                if (count > 0) {
                  stopifnot(vtPrevTot >= 1)
                  changeFracs[vtPrev, vtCurr, yr - 1] = count/vtPrevTot
                }
                else if (vtPrevTot == 0 && yr > 2) {
                  changeFracs[vtPrev, vtCurr, yr - 1] = changeFracs[vtPrev, 
                    vtCurr, yr - 2]
                }
            }
        }
    }
    nVTreduced = nVTall - sum(vts2omit)
    vtCountsReduced = array(0, c(nVTreduced, nYrs))
    k = 0
    for (vt in 1:nVTall) {
        if (!vts2omit[vt]) {
            k = k + 1
            vtCountsReduced[k, ] = vtCounts[vt, ]
        }
    }
    vtFracsReduced = array(0, c(nVTreduced, nYrs))
    for (yr in 1:nYrs) {
        totCounts = sum(vtCountsReduced[, yr])
        vtFracsReduced = vtCountsReduced/totCounts
    }
    changeFracsReducedByRows = array(0, c(nVTall, nVTreduced, 
        nYrs - 1))
    vts2keep = rep(0, times = nVTreduced)
    for (yr in 1:(nYrs - 1)) {
        k = 0
        for (vt in 1:nVTall) {
            if (!vts2omit[vt]) {
                k = k + 1
                vts2keep[k] = vt
                changeFracsReducedByRows[, k, yr] = changeFracs[, 
                  vt, yr]
            }
        }
    }
    changeFracsReduced = array(0, c(nVTreduced, nVTreduced, nYrs - 
        1))
    k = 0
    for (vt in 1:nVTall) {
        if (!vts2omit[vt]) {
            k = k + 1
            changeFracsReduced[k, , ] = changeFracsReducedByRows[vt, 
                , ]
        }
    }
    return(list(tgtFile = tgtFile, years = years, vts2keep = vts2keep, 
        vtFracsReduced = vtFracsReduced, changeFracsReduced = changeFracsReduced, 
        vt2pvtlut = vt2pvtlut))
  }

## Step 1
#ncdf.path = "MC2toPath/netcdf/WW2100_HadGEM2-ES85_year_sample.nc"
ncdf.path <- system.file("netcdf", "WW2100_HadGEM2-ES85_year_sample.nc", package = "MC2toPath")

## Step 2
base.calibration = "CONUS"

## Step 3
## This is what you would really do...
## vegChanges = VegTypeChanges(ncdf.th <- system.file("netcdf", "WW2100_HadGEM2-ES85_year_sample.nc", PACKAGE = "MC2toPath")path, base.calibration) 
## but we do this instead to save execution time for CRAN...
data(vegChanges_step3)
vegChanges = vegChanges_step3

## Step 7
VTs = c(6, 7, 8, 10, 11, 12, 16, 22, 36)
PVTs = c("fmh", "fwi", "fdd", "fvg", "fdw", "fuc", "fto", "ftm", "fsi")
Strata = c("OWC_fmh", "OWC_fwi", "OSW_fdd", "OWC_fvg", "OWC_fdw", "OSW_fuc", "OWC_fto", 
	"OSW_ftm", "OWC_fsi")
vt2pvtlut = data.frame(VT=VTs, PVT=PVTs, Stratum=Strata)

## Step 8
climateChangeTransitionTypes = paste(rep(PVTs, length(PVTs)), "2", rep(PVTs, 
	each = length(PVTs)), sep="")

## Step 11
## This is what you would really do...
# vegChanges = VegTypeChanges(ncdf.path, base.calibration, vt2pvtlut)
## but we do this instead to save execution time for CRAN...
data(vegChanges_step11)
vegChanges = vegChanges_step11

## Step 12
SaveVegChangeProbabilityMultipliers(vegChanges, base.calibration, 
	climateChangeTransitionTypes, vt2pvtlut)

## Step 13
SaveFireProbabilityMultipliers(ncdf.path, base.calibration, vt2pvtlut)



