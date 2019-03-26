library(odk)


### Name: odk2spss
### Title: Convert 'ODK' or 'XLSForm' to 'SPSS' Data Frame
### Aliases: odk2spss
### Keywords: odk XLSForm SPSS

### ** Examples


library(odk)
data(odk.frame)
data(gs.data)
##--Convert 'odk.frame' to 'SPSS' data frame and input gs.data data set.

odk2spss(xlsx=odk.frame, pc.data=gs.data, out.path="spss.sps")

##### Internet connection needed if pc.data = NULL




