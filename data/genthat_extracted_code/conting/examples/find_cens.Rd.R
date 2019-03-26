library(conting)


### Name: find_cens
### Title: Find Censored Cells
### Aliases: find_cens

### ** Examples

data(ScotPWID)
## Load the ScotPWID data. In this dataset, the S4 source corresponding 
## to the HCV database is subject to censoring. We use find_cens to find
## the censored cells.
find_cens(sources=~S1+S2+S3+S4,cens_source=~S4,data=ScotPWID)
## It will produce the vector with the following elements:
##[1]   9  25  41  57  73  89 105 121
## Let's look at these cells
ScotPWID[find_cens(sources=~S1+S2+S3+S4,cens_source=~S4,data=ScotPWID),]
## It will produce:
#      y S1 S2 S3  S4 Region Gender   Age
#9   122 un un un obs    GGC   Male Young
#25  135 un un un obs    GGC   Male   Old
#41   48 un un un obs    GGC Female Young
#57   38 un un un obs    GGC Female   Old
#73  134 un un un obs   Rest   Male Young
#89  104 un un un obs   Rest   Male   Old
#105  78 un un un obs   Rest Female Young
#121  25 un un un obs   Rest Female   Old



