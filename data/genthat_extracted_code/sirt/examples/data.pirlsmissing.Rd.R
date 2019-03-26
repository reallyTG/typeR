library(sirt)


### Name: data.pirlsmissing
### Title: Dataset from PIRLS Study with Missing Responses
### Aliases: data.pirlsmissing
### Keywords: datasets

### ** Examples

data(data.pirlsmissing)
# inspect missing rates
round( colMeans( data.pirlsmissing==9 ), 3 )
  ##    idstud  country  studwgt  R31G01M  R31G02C  R31G03M  R31G04C  R31G05M
  ##     0.000    0.000    0.000    0.009    0.076    0.012    0.203    0.018
  ##   R31G06M  R31G07M R31G08CZ R31G08CA R31G08CB  R31G09M  R31G10C  R31G11M
  ##     0.010    0.020    0.189    0.225    0.252    0.019    0.126    0.023
  ##   R31G12C R31G13CZ R31G13CA R31G13CB R31G13CC  R31G14M  R31P01M  R31P02C
  ##     0.202    0.170    0.198    0.220    0.223    0.074    0.013    0.039
  ##   R31P03C  R31P04M  R31P05C  R31P06C  R31P07C  R31P08M  R31P09C  R31P10M
  ##     0.056    0.012    0.075    0.043    0.074    0.024    0.062    0.025
  ##   R31P11M  R31P12M  R31P13M  R31P14C  R31P15C  R31P16C
  ##     0.027    0.030    0.030    0.126    0.130    0.127



