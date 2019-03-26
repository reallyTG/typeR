library(divDyn)


### Name: subtrialCR
### Title: Subsampling trial functions
### Aliases: subtrialCR subtrialOXW subtrialSQS

### ** Examples

#one classical rarefaction trial
  data(corals)
# return 5 references for each stage
  bRows<-subtrialCR(corals, bin="stg", unit="reference_no", q=5)
  # control
  unCor<-unique(corals[bRows,c("stg", "reference_no")])
  table(unCor$stg)
# classical rarefaction can also be used to do by reference subsampling of collections
  fossils <- corals[corals$stg!=95, ]
  # rows in the sampling standardization
  threeCollPerRef <- subtrialCR(dat=fossils, unit="collection_no", 
    bin="reference_no", q=3, useFailed=TRUE)
  # check: table of collections/references in the new subset (with failed!!)
  crosstab<-unique(fossils[threeCollPerRef,c("collection_no", "reference_no")])
  table(crosstab$reference_no)



