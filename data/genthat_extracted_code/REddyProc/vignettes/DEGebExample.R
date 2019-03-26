## ----setup, include = FALSE----------------------------------------------
library(knitr)
# rmarkdown::render("vignettes/DEGebExample.Rmd")
opts_chunk$set(out.extra = 'style = "display:block; margin: auto"'
    #, fig.align = "center"
    , fig.width = 4.3, fig.height = 3.2, dev.args = list(pointsize = 10)
    , message = FALSE
    )
knit_hooks$set(spar = function(before, options, envir) {
    if (before) {
        par( las = 1 )                   #also y axis labels horizontal
        par(mar = c(2.0,3.3,0,0) + 0.3 )  #margins
        par(tck = 0.02 )                          #axe-tick length inside plots             
        par(mgp = c(1.1,0.2,0) )  #positioning of axis title, axis labels, axis
     }
})
# genVigs("DEGebExample")

## ----results = 'hide'----------------------------------------------------
#isDevelopMode <- TRUE
if (!exists("isDevelopMode")) library(REddyProc)
set.seed(0815)      # for reproducible results

## ------------------------------------------------------------------------
		data(DEGebExample)
		summary(DEGebExample)

## ------------------------------------------------------------------------
		DEGebExample$VPD <- fCalcVPDfromRHandTair(DEGebExample$rH, DEGebExample$Tair)
		EddyProc.C <- sEddyProc$new('DE-Geb', DEGebExample, c('NEE','Rg','Tair','VPD', 'Ustar'))
		EddyProc.C$sSetLocationInfo(Lat_deg.n = 51.1, Long_deg.n = 10.9, TimeZone_h.n = 1)  #Location of Gebesee

## ----DEGeb_estUStar1a, spar = TRUE, fig.width = 10-----------------------
	seasonStarts <- as.data.frame( do.call( rbind, list(
		  c(70,2004)
            ,c(210,2004)
            ,c(320,2004)
            ,c(70,2005)
            ,c(180,2005)
            ,c(320,2005)
            ,c(120,2006)
            ,c(305,2006) 		
	)))
	seasonFactor <- usCreateSeasonFactorYdayYear(
	  DEGebExample$DateTime + 15*60, starts = seasonStarts)
	plot( NEE ~ DateTime, DEGebExample )
	seasonStartsDate <- fConvertTimeToPosix( data.frame(Year = seasonStarts[,2]
		, DoY = seasonStarts[,1], Hour = 0.25),'YDH'
		, Year.s = "Year", Day.s = "DoY",Hour.s = "Hour")
	abline( v = seasonStartsDate$DateTime)

## ----DEGeb_estUStar1b, cache = TRUE--------------------------------------
	(uStarTh <- EddyProc.C$sEstUstarThreshold(seasonFactor.v = seasonFactor)$uStarTh)
	# estimation can be inspected by plotting the saturation of NEE with UStar 
	# for the temperatures of one season
	#EddyProc.C$sPlotNEEVersusUStarForSeason( levels(uStarTh$season)[2] )

## ----DEGeb_estUStar1c----------------------------------------------------
	(UstarThres.df <- usGetSeasonalSeasonUStarMap(uStarTh))

## ----DEGeb_gapFill1, cache = TRUE, output = 'hide', message = FALSE------
	EddyProc.C$sMDSGapFillAfterUstar(
	  'NEE', FillAll.b = FALSE, UstarThres.df = UstarThres.df, Verbose.b = FALSE)

## ----DEGeb_estUStarBoot1, cache = TRUE, message = FALSE------------------
	# here, because of speed only 30 samples instead of 100, and 10% and 90% 
	# percentile instead of 5%,50%, and 95%
	uStarRes <- EddyProc.C$sEstUstarThresholdDistribution( 
	  seasonFactor.v = seasonFactor, nSample = 30L, probs = c(0.1,0.9))
	(UstarThres.df <- usGetSeasonalSeasonUStarMap(uStarRes))

## ----DEGeb_gapFillBoot1, cache = TRUE, message = FALSE, output = 'hide'----
	EddyProc.C$sMDSGapFillAfterUStarDistr(
	  'NEE', FillAll.b = FALSE, UstarThres.df = UstarThres.df)

## ------------------------------------------------------------------------
	grep("^NEE.*_f$", colnames( EddyProc.C$sExportResults()), value = TRUE )

## ----DEGeb_fluxPart1, cache = TRUE---------------------------------------
	EddyProc.C$sMDSGapFill('Tair', FillAll.b = FALSE)
	for (suffix in c('U10', 'U90')) {
		EddyProc.C$sMRFluxPartition(Suffix.s = suffix)
	}
	grep("U10", colnames(EddyProc.C$sExportResults()), value = TRUE) 	

## ----DEGeb_estUStarCPT, cache = TRUE-------------------------------------
	EddySetups.C <- sEddyProc$new(
	  'DE-Geb', DEGebExample, c('NEE','Rg','Tair','VPD', 'Ustar'))
	resUStar <- EddySetups.C$sEstUstarThreshold(
						ctrlUstarEst.l = usControlUstarEst(isUsingCPTSeveralT = TRUE)
						,seasonFactor.v = seasonFactor
				)$uStarTh
	(UstarThresCP.df <- usGetSeasonalSeasonUStarMap(resUStar))
	#UstarThres.df

