library(AnalyzeFMRI)


### Name: f.write.analyze
### Title: writes an array to a .img/.hdr pair in ANALYZE format
### Aliases: f.write.analyze write2byteappend_JM write8bit_JM
###   write8bitappend_JM write_analyze_header_wrap_JM
###   write_nifti_header_wrap_JM writefloat_JM writefloatappend_JM
### Keywords: utilities

### ** Examples

a<-array(rnorm(20*30*40*3),dim=c(20,30,40,3))
file<-"temp"
f.write.analyze(a,file,size="float")
f.analyze.file.summary("temp.img")



