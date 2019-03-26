library(OnAge)


### Name: onset.test
### Title: Tests the null hypothesis that the age at the onset of
###   senescence is the same in two groups
### Aliases: onset.test

### ** Examples

if(requireNamespace("lme4", quietly=TRUE)) {
    data(RoeDeerMassData)
    RoeDeerMassData$ID <- factor(RoeDeerMassData$ID)
    RoeDeerMassData$cohort <- factor(RoeDeerMassData$cohort)

    dataFCH <- RoeDeerMassData[RoeDeerMassData$sex%in%"F"&
                                 RoeDeerMassData$population%in%"CH", ]
    dataMCH <- RoeDeerMassData[RoeDeerMassData$sex%in%"M"&
                                 RoeDeerMassData$population%in%"CH", ]
    dataFTF <- RoeDeerMassData[RoeDeerMassData$sex%in%"F"&
                                 RoeDeerMassData$population%in%"TF", ]
    dataMTF <- RoeDeerMassData[RoeDeerMassData$sex%in%"M"&
                                 RoeDeerMassData$population%in%"TF", ]

    ## b1: function for piecewise regression (transforms x into 0 before bp)
    b1 <- function(x, bp) ifelse(x < bp, 0, x - bp)

    ## Use this function to define the model in which the differential
    ## onset hypothesis is tested.
    ll <- function(thr, dataIn){
        logLik(lme4::lmer(body.mass ~ b1(age, thr) + age.at.last.capture + 
            last.year.of.capture + (1|ID) + (1|cohort), data=dataIn, 
            REML="FALSE"))
    }

    search.range <- c(6,12) # data not available before 6 years old
    search.range.TF <- search.range.CH <- search.range

    ## Not run: 
##D       # if you don't run the example in RStudio, create a new graphic 
##D       # window with suitable dimensions
##D       if(.Platform$GUI!="RStudio") {dev.new(width=15, height=5)}
##D       # all graphs are square
##D       par(pty="s")
##D       
##D       # test for Trois Fontaines
##D       res.tf <- onset.test(ll, dataFTF, dataMTF, search.range.TF, do.plot=TRUE)
##D       
##D       if(.Platform$GUI!="RStudio") {dev.new(width=15, height=5)}
##D       par(pty="s")
##D       
##D       # test for Chizé
##D       res.ch <- onset.test(ll, dataFCH, dataMCH, search.range.CH, do.plot=TRUE)
##D       
##D       cat(sprintf("p-value for differential age at onset is %g in 
##D           Trois Fontaines, %g in Chizé", res.tf$pv, res.ch$pv))
##D     
## End(Not run)
    
    # a shorter executable example for Trois Fontaines
    set.seed(40)
    shortdataFTF <- dataFTF[sample(1:NROW(dataFTF), 200), ]
    shortdataMTF <- dataMTF[sample(1:NROW(dataMTF), 100), ]
    res.tf.short <- onset.test(ll, shortdataFTF, shortdataMTF, search.range.TF, 
      do.plot=FALSE, CI.lvl=NA)
  }



