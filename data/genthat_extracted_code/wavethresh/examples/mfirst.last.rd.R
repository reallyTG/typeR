library(wavethresh)


### Name: mfirst.last
### Title: Build a first/last database for multiple wavelet transforms.
### Aliases: mfirst.last
### Keywords: datagen

### ** Examples

#
#To see the housekeeping variables for a decomposition with
# 4 filter coefficient matices
# 5 resolution levels and a decimation scale of two
# use:
mfirst.last(4,5,2)
# $first.last.c:
#	 First Last Offset
# [1,]     0    0     62
# [2,]     0    1     60
# [3,]     0    3     56
# [4,]     0    7     48
# [5,]     0   15     32
# [6,]     0   31      0
# 
# $nvecs.c:
# [1] 63
# 
# $first.last.d:
#	 First Last Offset
# [1,]     0    0     30
# [2,]     0    1     28
# [3,]     0    3     24
# [4,]     0    7     16
# [5,]     0   15      0
# 
# $nvecs.d:
# [1] 31



