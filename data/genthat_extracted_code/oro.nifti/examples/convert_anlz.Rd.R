library(oro.nifti)


### Name: Convert ANALYZE Codes
### Title: Convert ANALYZE Codes
### Aliases: 'Convert ANALYZE Codes' convert.bitpix.anlz
###   convert.datatype.anlz convert.orient.anlz

### ** Examples


##  4 = SIGNED_SHORT
convert.datatype.anlz(4)
## 16 = FLOAT
convert.datatype.anlz(16)
##  2 = "saggital unflipped"
convert.orient.anlz(2)
##  4 = "coronal flipped"
convert.orient.anlz(4)




