library(odk)


### Name: gs.data
### Title: 'Google Sheets' Data for 'odk.frame'
### Aliases: gs.data
### Keywords: gs.data

### ** Examples

library(odk)
data(gs.data)
data(odk.frame)

### For convert 'odk.frame' to 'SPSS' frame and input Corresponding 'Google Sheets' data

odk2spss(xlsx=odk.frame, pc.data=gs.data, out.path="spss.sps")



