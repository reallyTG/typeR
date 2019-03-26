library(diveMove)


### Name: TDRcalibrate-accessors
### Title: Methods to Show and Extract Basic Information from
###   "TDRcalibrate" Objects
### Aliases: TDRcalibrate-methods TDRcalibrate-accessors getDAct
###   getDPhaseLab getDiveModel getDiveDeriv getGAct getSpeedCoef getTDR
###   getDAct,TDRcalibrate,missing-method
###   getDAct,TDRcalibrate,character-method
###   getDPhaseLab,TDRcalibrate,missing-method
###   getDPhaseLab,TDRcalibrate,numeric-method
###   getDiveModel,TDRcalibrate,missing-method
###   getDiveModel,TDRcalibrate,numeric-method
###   getDiveDeriv,diveModel-method getDiveDeriv,TDRcalibrate-method
###   getGAct,TDRcalibrate,missing-method
###   getGAct,TDRcalibrate,character-method show,TDRcalibrate-method
###   show,diveModel-method getSpeedCoef,TDRcalibrate-method
###   getTDR,TDRcalibrate-method
### Keywords: methods

### ** Examples


## No test: 
## Too long for checks
## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)
dcalib		# the 'TDRcalibrate' that was created

## Beginning times of each successive phase in record
getGAct(dcalib, "begin")

## Factor of dive IDs
dids <- getDAct(dcalib, "dive.id")
table(dids[dids > 0])		# samples per dive

## Factor of dive phases for given dive
getDPhaseLab(dcalib, 19)
## Full dive model
(dm <- getDiveModel(dcalib, 19))
str(dm)

## Derivatives
getDiveDeriv(dcalib, diveNo=19)
(derivs.desc <- getDiveDeriv(dcalib, diveNo=19, phase="descent"))
(derivs.bott <- getDiveDeriv(dcalib, diveNo=19, phase="bottom"))
(derivs.asc <- getDiveDeriv(dcalib, diveNo=19, phase="ascent"))
if (require(lattice)) {
    fl <- c("descent", "bottom", "ascent")
    bwplot(~ derivs.desc$y + derivs.bott$y + derivs.asc$y,
           outer=TRUE, allow.multiple=TRUE, layout=c(1, 3),
           xlab=expression(paste("Vertical rate (", m %.% s^-1, ")")),
           strip=strip.custom(factor.levels=fl))
}

## End(No test)




