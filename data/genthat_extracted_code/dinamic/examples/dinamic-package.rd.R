library(dinamic)


### Name: dinamic-package
### Title: Assessing the Statistical Significance of Recurrent DNA Copy
###   Number Aberrations
### Aliases: dinamic-package dinamic
### Keywords: package

### ** Examples

data(wilms.data)
data(wilms.markers)
data(annot.file)
detailedLook(wilms.data, wilms.markers, annot.file, 100, 3)   
#Produces the following output:
#" 1"       "155656176" "R:A-MEXP-192:RP11-393K10" "196"  "0.01"
#"12"       " 38270107" "R:A-MEXP-192:RP11-519E12" "2294" "0.01"
#" 8"       "  4554176" "R:A-MEXP-192:RP11-337D8"  "1659" "0.01"

quickLook(wilms.data, wilms.markers, annot.file, 100, 3)   
#Produces the following output:
#" 1"       "155656176" "R:A-MEXP-192:RP11-393K10" "196"  "0.01"
#"12"       " 38270107" "R:A-MEXP-192:RP11-519E12" "2294" "0.01"
#" 8"       "  4554176" "R:A-MEXP-192:RP11-337D8"  "1659" "0.01"



