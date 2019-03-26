## ----setup, include = FALSE----------------------------------------------
library(knitr)
#rmarkdown::render("vignettes/uStarCases.Rmd")
opts_knit$set(root.dir = '..')
opts_chunk$set(
    #, fig.align = "center"
    #, fig.width = 3.27, fig.height = 2.5, dev.args = list(pointsize = 10)
    #,cache = TRUE
    #, fig.width = 4.3, fig.height = 3.2, dev.args = list(pointsize = 10)
    #, fig.width = 6.3, fig.height = 6.2, dev.args = list(pointsize = 10)
    # works with html but causes problems with latex
    #,out.extra = 'style = "display:block; margin: auto"' 
    )
knit_hooks$set(spar = function(before, options, envir) {
    if (before) {
        par(las = 1 )                   #also y axis labels horizontal
        par(mar = c(2.0,3.3,0,0) + 0.3 )  #margins
        par(tck = 0.02 )                          #axe-tick length inside plots             
        par(mgp = c(1.1,0.2,0) )  #positioning of axis title, axis labels, axis
     }
})

## ---- include = FALSE, warning = FALSE-----------------------------------
#themeTw <- theme_bw(base_size = 10) + theme(axis.title = element_text(size = 9))

## ----init, message = FALSE, output = 'hide'------------------------------
#+++ load libraries used in this vignette
library(REddyProc)
library(dplyr)
#+++ define directory for outputs
outDir <- tempdir()  # CRAN policy dictates to write only to this dir in examples
#outDir <- "out"     # to write to subdirectory of current users dir
#+++ Add time stamp in POSIX time format to example data
EddyDataWithPosix.F <- fConvertTimeToPosix(Example_DETha98, 'YDH',Year.s = 'Year' 
    ,Day.s = 'DoY',Hour.s = 'Hour')

## ----noUStar, message = FALSE--------------------------------------------
EddyProc.C <- sEddyProc$new('DE-Tha', EddyDataWithPosix.F, 
	c('NEE','Rg','Tair','VPD', 'Ustar'))
EddyProc.C$sMDSGapFill('NEE')
grep("NEE.*_f$",names(EddyProc.C$sExportResults()), value = TRUE)

## ----userUStar, message = FALSE------------------------------------------
EddyProc.C <- sEddyProc$new('DE-Tha', EddyDataWithPosix.F, 
	c('NEE','Rg','Tair','VPD', 'Ustar'))
uStar <- 0.46
EddyProc.C$sMDSGapFillAfterUstar('NEE', UstarThres.df = uStar)
grep("NEE.*_f$",names(EddyProc.C$sExportResults()), value = TRUE)

## ----singleUStar, message = FALSE----------------------------------------
EddyProc.C <- sEddyProc$new('DE-Tha', EddyDataWithPosix.F, 
	c('NEE','Rg','Tair','VPD', 'Ustar'))
# estimating the thresholds based on the data (without bootstrap)
(uStarTh <- EddyProc.C$sEstUstarThreshold()$uStarTh)
# may plot saturation of NEE with UStar for a specified season to pdf
EddyProc.C$sPlotNEEVersusUStarForSeason(levels(uStarTh$season)[3], dir = outDir )

## ----singleUStarGapfill, message = FALSE---------------------------------
EddyProc.C$sMDSGapFillAfterUstar('NEE')
grep("NEE.*_f$",names(EddyProc.C$sExportResults()), value = TRUE)

