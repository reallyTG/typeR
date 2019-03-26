library(SMITIDvisu)


### Name: mstVariant
### Title: mstVariant
### Aliases: mstVariant

### ** Examples

library(SMITIDvisu)
data(st)
mstV <- mstVariant(st.dist113_all,st.prop113_all, st.listTimeProp113)
## No test: 
 
## export as standalone html file
htmlwidgets::saveWidget(mstV, "mstVariant.html")
browseURL("mstVariant.html")
## End(No test)




