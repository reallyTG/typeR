library(treedater)


### Name: sampleYearsFromLabels
### Title: Compute a vector of numeric sample times from labels in a
###   sequence aligment or phylogeny
### Aliases: sampleYearsFromLabels

### ** Examples

## A couple of labels for Ebola virus sequences: 
sampleYearsFromLabels( c('EBOV|AA000000|EM104|SierraLeone_EM|2014-06-02'
                       , 'EBOV|AA000000|G3713|SierraLeone_G|2014-06-09')
, delimiter='|' )
## Equivalently: 
sampleYearsFromLabels( c('EBOV|AA000000|EM104|SierraLeone_EM|2014-06-02'
                       , 'EBOV|AA000000|G3713|SierraLeone_G|2014-06-09')
 , regex='[0-9]+-[0-9]+-[0-9]+')




