library(AICcmodavg)


### Name: detHist
### Title: Compute Summary Statistics from Detection Histories
### Aliases: detHist detHist.default detHist.unmarkedFitColExt
###   detHist.unmarkedFitOccu detHist.unmarkedFitOccuFP
###   detHist.unmarkedFitOccuRN detHist.unmarkedFrameOccu
###   detHist.unmarkedFrameOccuFP detHist.unmarkedMultFrame print.detHist
### Keywords: models

### ** Examples

##data from Mazerolle (2015)
## Not run: 
##D data(bullfrog)
##D 
##D ##detection data
##D detections <- bullfrog[, 3:9]
##D 
##D ##load unmarked package
##D if(require(unmarked)){
##D 
##D ##assemble in unmarkedFrameOccu
##D bfrog <- unmarkedFrameOccu(y = detections)
##D 
##D ##compute descriptive stats from data object
##D detHist(bfrog)
##D 
##D ##run model
##D fm <- occu(~ 1 ~ 1, data = bfrog)
##D ##compute descriptive stats from model object
##D detHist(fm)
##D }
## End(Not run)



