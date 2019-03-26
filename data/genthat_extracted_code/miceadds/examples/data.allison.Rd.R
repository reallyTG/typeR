library(miceadds)


### Name: data.allison
### Title: Datasets from Allison's _Missing Data_ Book
### Aliases: data.allison data.allison.gssexp data.allison.hip
###   data.allison.usnews
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Hip dataset | Imputation using a wide format
##D #############################################################################
##D 
##D # at first, the hip dataset is 'melted' for imputation
##D 
##D data(data.allison.hip)
##D   ##   head(data.allison.hip)
##D   ##     SID WAVE ADL PAIN SRH WALK   CESD
##D   ##   1   1    1   3    0   2    1  9.000
##D   ##   2   1    2   2    5   4    0 28.000
##D   ##   3   1    3   3    0   2    0 31.000
##D   ##   4   1    4   3    0   2    0 11.579
##D   ##   5   2    1   3    0   4    0     NA
##D   ##   6   2    2   1    1   1    0  2.222
##D 
##D library(reshape)
##D hip.wide <- reshape::reshape(data.allison.hip, idvar="SID", timevar="WAVE",
##D                 direction="wide")
##D   ##   > head(hip.wide, 2)
##D   ##     SID ADL.1 PAIN.1 SRH.1 WALK.1 CESD.1 ADL.2 PAIN.2 SRH.2 WALK.2 CESD.2 ADL.3
##D   ##   1   1     3      0     2      1      9     2      5     4      0 28.000     3
##D   ##   5   2     3      0     4      0     NA     1      1     1      0  2.222     2
##D   ##     PAIN.3 SRH.3 WALK.3 CESD.3 ADL.4 PAIN.4 SRH.4 WALK.4 CESD.4
##D   ##   1      0     2      0     31     3      0     2      0 11.579
##D   ##   5      5     1      0     12     1     NA     2      0     NA
##D 
##D # imputation of the hip wide dataset
##D imp <- mice::mice( as.matrix( hip.wide[,-1] ), m=5, maxit=3 )
##D summary(imp)
## End(Not run)



