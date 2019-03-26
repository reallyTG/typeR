library(emuR)


### Name: label
### Title: Get labels / utterances from segment list
### Aliases: label label.emusegs utt.emusegs utt
### Keywords: methods

### ** Examples


   data(dip)
   #dip is a segment list - first ten segments only
   dip[1:10,]
   

   #extract labels from the segment list
   dips.labs = label(dip)
   dips.labs 
   




