library(PwrGSD)


### Name: GrpSeqBnds
### Title: Computes efficacy and futility boundaries
### Aliases: GrpSeqBnds
### Keywords: design htest

### ** Examples


    ## NOTE: In an unweighted analysis, the variance ratios and event ratios
    ## are the same, whereas in a weighted analysis, they are quite different.
    ##
    ## For example, in a trial with 7 or so years of accrual and maximum follow-up of 20 years
    ## using the stopped Fleming-Harrington weights, `WtFun' = "SFH", with paramaters
    ## `ppar' = c(0, 1, 10) we might get the following vector of variance ratios:

    frac    <- c(0.006995655, 0.01444565, 0.02682463, 0.04641363, 0.0585665,
                 0.07614902, 0.1135391, 0.168252, 0.2336901, 0.3186155, 0.4164776,
                 0.5352199, 0.670739, 0.8246061, 1)


    ## and the following vector of event ratios:

    frac.ii <- c(0.1494354, 0.1972965, 0.2625075, 0.3274323, 0.3519184, 0.40231,
                 0.4673037, 0.5579035, 0.6080742, 0.6982293, 0.7671917, 0.8195019,
                 0.9045182, 0.9515884, 1)

    ## and the following drift under a given alternative hypothesis
               
    drift <-   c(0.06214444, 0.1061856, 0.1731267, 0.2641265, 0.3105231, 0.3836636,
                 0.5117394, 0.6918584, 0.8657705, 1.091984, 1.311094, 1.538582,
                 1.818346, 2.081775, 2.345386)

    ## JUST ONE SIDED EFFICACY BOUNDARY
    ## In this call, we calculate a one sided efficacy boundary at each of 15 analyses
    ## which will occur at the given (known) variance ratios, and we use the variance
    ## ratio for type I error probability spending, with a total type I error probabilty
    ## of 0.05, using the Lan-Demets method with Obrien-Fleming spending (the default).

    gsb.all.just.eff <- GrpSeqBnds(frac=frac, 
                                   EfficacyBoundary=LanDemets(alpha=0.05, spending=ObrienFleming))

    ## ONE SIDED EFFICACY AND FUTILTY BOUNDARIES
    ## In this call, we calculate a one sided efficacy boundary at each of 15 analyses
    ## which will occur at the given (known) variance ratios, and we use the variance
    ## ratio for type I and type II error probability spending, with a total type I error
    ## probabilty of 0.05 and a total type II error probability of 0.10, using the Lan-Demets
    ## method with Obrien-Fleming spending (the default) for both efficacy and futilty.

    gsb.all.eff.fut <- GrpSeqBnds(frac=frac,  
                                  EfficacyBoundary=LanDemets(alpha=0.05, spending=ObrienFleming),
                                  FutilityBoundary=LanDemets(alpha=0.10, spending=ObrienFleming),
                                  drift=drift)

    ## Now suppose that we are performing the 7th interim analysis. We don't know what the variance
    ## will be at the end of the trial, so we normalize variances of the current and previous
    ## statistics by the variance of the current statistic.  This is equivalent to the following
    ## length 7 vector of variance ratios:

    frac7 <- frac[1:7]/frac[7]

    ## To proceed under the "unknown variance at end of trial" case, we must use a second
    ## scale for spending type I and II error probabilty. Unlike the above scale
    ## which is renormalized at each analysis to have value 1 at the current analysis, the
    ## alpha spending scale must be monotone increasing and attain the value 1 only at the
    ## end of the trial. A natural choice is the event ratio, which is known in advance if
    ## the trial is run until a required number of events is obtained, a so called
    ## maximum information trial:

    frac7.ii <- frac.ii[1:7]

    ## the first seven values of the drift function

    drift7 <- drift[1:7]/frac[7]^0.5

    gsb.1st7.eff.fut <- GrpSeqBnds(frac=frac7, frac.ii=frac7.ii,  
                                   EfficacyBoundary=LanDemets(alpha=0.05, spending=ObrienFleming),
                                   FutilityBoundary=LanDemets(alpha=0.10, spending=ObrienFleming),
				   drift=drift7)

    ## Of course there are other options not covered in these examples but this should get you
    ## started



