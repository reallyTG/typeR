library(Repliscope)


### Name: normaliseRatio
### Title: A function to normalise ratio values from 'ratio' column of the
###   provided dataframe to fit biologically-relevant scale. It scales
###   values either using supplied 'rFactor' value or automatically to best
###   fit 1 to 2 scale. Normalisation factor used is stored in
###   'ratioFactor' column and also passed as the dataframe comment. To
###   extract it, use 'attributes(mergedBed)$comment'
### Aliases: normaliseRatio normalizeRatio
### Keywords: bioinformatics genomics replication

### ** Examples

ratioDF <- normaliseRatio(W303) ## scales to 1 to 2 range, replaces original values.
ratioDF <- normaliseRatio(W303,rFactor=1.41,replace=FALSE)
# (multiplies score values by 1.41 and keeps the original values)



