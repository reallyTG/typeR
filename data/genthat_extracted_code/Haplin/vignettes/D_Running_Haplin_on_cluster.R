## ----setup,include=FALSE-------------------------------------------------
knitr::opts_chunk$set( echo = TRUE )

## ----eval=FALSE----------------------------------------------------------
#  initParallelRun()

## ----eval=FALSE----------------------------------------------------------
#  haplinSlide( trial.data2.prep, use.missing = TRUE, ccvar = 2, design =
#    "cc.triad", reference = "ref.cat", response = "mult", para.env = "Rmpi" )

## ----eval=FALSE----------------------------------------------------------
#  finishParallelRun()

## ----eval=FALSE----------------------------------------------------------
#  library( Haplin )
#  
#  initParallelRun()
#  
#  chosen.markers <- 3:55
#  
#  data.in <- genDataLoad( filename = "mynicedata" )
#  # analysis without maternal risks calculated
#  results1 <- haplinSlide( data = data.in, markers = chosen.markers, winlength = 2,
#  	design = "triad", use.missing = TRUE, maternal = FALSE, response = "free",
#  	cpus = 2, verbose = FALSE, printout = FALSE, para.env = "Rmpi" )
#  
#  # analysis with maternal risks calculated
#  results2 <- haplinSlide( data = data.in, markers = chosen.markers, winlength = 2,
#  	design = "triad", use.missing = TRUE, maternal = TRUE, response = "mult",
#  	cpus = 2, verbose = FALSE, printout = FALSE, para.env = "Rmpi" )
#  
#  finishParallelRun()

