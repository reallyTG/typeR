library(sampleSelection)


### Name: RandHIE
### Title: RAND Health Insurance Experiment
### Aliases: RandHIE
### Keywords: datasets

### ** Examples

## Cameron and Trivedi (2005): Section 16.6, page 553ff
data( RandHIE )
subsample <- RandHIE$year == 2 & !is.na( RandHIE$educdec )
selectEq <- binexp ~ logc + idp + lpi + fmde + physlm + disea +
   hlthg + hlthf + hlthp + linc + lfam + educdec + xage + female +
   child + fchild + black
outcomeEq <- lnmeddol ~ logc + idp + lpi + fmde + physlm + disea +
   hlthg + hlthf + hlthp + linc + lfam + educdec + xage + female +
   child + fchild + black
# ML estimation
cameron <- selection( selectEq, outcomeEq, data = RandHIE[ subsample, ] )
summary( cameron )



