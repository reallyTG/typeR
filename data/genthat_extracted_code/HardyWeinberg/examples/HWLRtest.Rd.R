library(HardyWeinberg)


### Name: HWLRtest
### Title: Perform likelihood ratio test comparing two nested scenarios for
###   a bi-allelic genetic variant, distinguishing the two sexes.
### Aliases: HWLRtest
### Keywords: htest

### ** Examples

males <- c(AA=11,AB=32,BB=13) 
females <- c(AA=14,AB=23,BB=11)

#
# test EAF
#

lr1.out <- HWLRtest(males,females,scene.null="S3",scene.alt="S6")

#
# test EIC given EAF
#


lr2.out <- HWLRtest(males,females,scene.null="S2",scene.alt="S3")

#
# test HWP versus EIC, given EAF.
#

lr3.out <- HWLRtest(males,females,scene.null="S1",scene.alt="S2")




