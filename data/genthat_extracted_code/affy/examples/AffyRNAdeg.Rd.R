library(affy)


### Name: AffyRNAdeg
### Title: Function to assess RNA degradation in Affymetrix GeneChip data.
### Aliases: AffyRNAdeg summaryAffyRNAdeg plotAffyRNAdeg
### Keywords: hplot manip

### ** Examples

if (require(affydata)) {
  data(Dilution)
  RNAdeg<-AffyRNAdeg(Dilution)
  plotAffyRNAdeg(RNAdeg)
}



