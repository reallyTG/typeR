library(wavethresh)


### Name: first.last
### Title: Build a first/last database for wavelet transforms.
### Aliases: first.last
### Keywords: manip

### ** Examples

#
#If you're twisted then you may just want to look at one of these.
#
first.last(length(filter.select(2)), 64)
#$first.last.c:
#First Last Offset
#[1,]     0    0    126
#[2,]     0    1    124
#[3,]     0    3    120
#[4,]     0    7    112
#[5,]     0   15     96
#[6,]     0   31     64
#[7,]     0   63      0
#
#$ntotal:
#[1] 127
#
#$first.last.d:
#First Last Offset
#[1,]     0    0     62
#[2,]     0    1     60
#[3,]     0    3     56
#[4,]     0    7     48
#[5,]     0   15     32
#[6,]     0   31      0
#
#$ntotal.d:
#[1] 63
#
#



