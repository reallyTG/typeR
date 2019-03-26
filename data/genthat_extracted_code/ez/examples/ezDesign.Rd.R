library(ez)


### Name: ezDesign
### Title: Plot the balance of data in an experimental design
### Aliases: ezDesign

### ** Examples

#Read in the ANT2 data (see ?ANT2).
data(ANT2)
head(ANT2)
ezPrecis(ANT2)

#toss NA trials
ANT2 = ANT2[!is.na(ANT2$rt),]

ezDesign(
    data = ANT2
    , x = trial
    , y = subnum
    , row = block
    , col = group
)
#subnum #7 is missing data from the last half of the experiment

## Not run: 
##D ezDesign(
##D     data = ANT2
##D     , x = flank
##D     , y = subnum
##D     , row = cue
##D )
##D #again, subnum#7 has half the data as the rest
##D 
##D #now look at error rates, which affect the number of RTs we can use
##D ezDesign(
##D     data = ANT2[ANT2$error==0,]
##D     , x = flank
##D     , y = subnum
##D     , row = cue
##D )
##D #again, subnum#7 stands out because they have half the data as the rest
##D #also, subnum#14 has no data in any incongruent cells, suggesting that
##D ##they made all errors in this condition
##D #finally, subnum#12 has virtually no data, suggesting that they mistakenly
##D ##swapped responses
## End(Not run)



