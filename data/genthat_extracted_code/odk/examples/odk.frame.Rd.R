library(odk)


### Name: odk.frame
### Title: 'Google Sheets' or 'XLSForm' Dummy 'ODK' Frame
### Aliases: odk.frame
### Keywords: odk.frame

### ** Examples

library(odk)
data(odk.frame)
data(gs.data)

### For convert 'odk.frame' to 'SPSS' frame and input Corresponding 'Google Sheets' data

odk2spss(xlsx=odk.frame, pc.data=gs.data, out.path="spss.sps")



