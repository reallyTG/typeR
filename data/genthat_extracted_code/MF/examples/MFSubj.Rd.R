library(MF)


### Name: MFSubj
### Title: Subject components of mitigated fraction
### Aliases: MFSubj

### ** Examples

x <- MFSubj(lesion ~ group, calflung)
x

#  MF = 0.44 comparing vac to con
#
#  MF Subject Components
#
#    mf.j freq    min.y   max.y
#    1.00    6 0.000030 0.00970
#    0.84    1 0.012500 0.01250
#    0.76    3 0.016650 0.02030
#    0.68    6 0.023250 0.03190
#    0.04    1 0.132100 0.13210
#   -0.04    3 0.144575 0.16325
#   -0.20    2 0.210000 0.21925
#   -0.36    1 0.292000 0.29200
#   -0.52    1 0.356500 0.35650
#   -0.84    1 0.461500 0.46150


mean(x$subj[,'mf.j'])

# [1] 0.44



