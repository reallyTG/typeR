library(TwoPhaseInd)


### Name: caseonly
### Title: A function to deal with case-only designs
### Aliases: caseonly
### Keywords: case-only designs

### ** Examples

#form the data
data(acodata)
cdata=acodata[acodata[,2]==1,]
cfit=caseonly(data=cdata,
              treatment="f_treat",
              BaselineMarker="fcgr2a.3",
              extra=c("f_agele30","f_hsv_2","f_ad5gt18","f_crcm",
              "any_drug","num_male_part_cat","uias","uras"))
cfit              



