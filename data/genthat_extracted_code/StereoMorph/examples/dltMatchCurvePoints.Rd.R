library(StereoMorph)


### Name: dltMatchCurvePoints
### Title: Matches curve points between two camera views
### Aliases: dltMatchCurvePoints summary.dltMatchCurvePoints
###   print.summary.dltMatchCurvePoints
### Keywords: DLT

### ** Examples

## GET THE FILE DIRECTORY FOR EXTRA R PACKAGE FILES
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

## SET FILE PATH TO LANDMARK DATA
file <- paste0(fdir, "lm_2d_a2_v", 1:2, ".txt")

## LOAD COEFFICIENTS
cal.coeff <- as.matrix(read.table(file=paste0(fdir, "cal_coeffs.txt")))

## READ LANDMARKS INTO LIST
lm.list <- readLandmarksToList(file=file, row.names=1)

## MATCH CURVE POINTS FOR ONE CURVE
## FIRST TYPE OF LANDMARK INPUT
## RETURNS LIST OF MATCHING POINTS WITHOUT CURVE NAME
dlt_match <- dltMatchCurvePoints(lm.list$pterygoid_crest_R, cal.coeff)

## PRINT SUMMARY
summary(dlt_match)

## SET A DIFFERENT REFERENCE VIEW
## SECOND VIEW HAS 80 FEWER POINTS
## dlt_match <- dltMatchCurvePoints(lm.list$pterygoid_crest_R, cal.coeff, ref.view=2)

## MATCH CURVE POINTS FOR ALL CURVES IN LIST
## SECOND TYPE OF LANDMARK INPUT
## RETURNS LIST OF ALL LANDMARKS AND MATCHED CURVE POINTS WITH CURVE NAMES
## dlt_match <- dltMatchCurvePoints(lm.list, cal.coeff)



