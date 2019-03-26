### R code from vignette source 'SIBER.Rnw'

###################################################
### code chunk number 1: SIBER.Rnw:42-44
###################################################
options(width=80)
options(continue=' ')


###################################################
### code chunk number 2: loadLibrary
###################################################
library(SIBERG)


###################################################
### code chunk number 3: SIBER.Rnw:85-90
###################################################
set.seed(1000)
N <- 100 # sample size
G <- 200 # number of simulated genes
# RNAseq count data simulated from NB model with mean 1000, dispersion=0.2
Dat <-  matrix(rnbinom(G*N, mu=1000, size=1/0.2), nrow=G) 


###################################################
### code chunk number 4: SIBER.Rnw:96-97
###################################################
SIBER(y=Dat[1, ], model='LN')


###################################################
### code chunk number 5: SIBER.Rnw:102-103
###################################################
SIBER(y=Dat[1, ], model='NB')


###################################################
### code chunk number 6: SIBER.Rnw:108-109
###################################################
SIBER(y=Dat[1, ], model='GP')


###################################################
### code chunk number 7: SIBER.Rnw:115-116
###################################################
SIBER(y=log(Dat[1, ]+1), model='NL')


###################################################
### code chunk number 8: SIBER.Rnw:135-160
###################################################
if (require(edgeR)) {
  TMM <- calcNormFactors(Dat, method='TMM')
} else {
  # manually set factors from previous computations
  TMM <- c(1.0390711, 0.9813734, 1.0091593, 0.9641022, 1.0137000,
           1.0188657, 0.9648757, 0.9956814, 0.9689530, 0.9774278,
           1.0059115, 1.0076910, 0.9923854, 1.0121838, 1.0249094,
           1.0403172, 0.9887074, 1.0003546, 0.9998479, 0.9844905,
           1.0040203, 0.9692244, 0.9987567, 1.0063895, 0.9954510,
           1.0204917, 0.9717720, 1.0317981, 0.9826344, 0.9817171,
           0.9949059, 0.9745569, 0.9652138, 1.0075196, 0.9879748,
           0.9929244, 0.9895606, 1.0144117, 1.0612923, 0.9626716,
           1.0049376, 1.0192416, 0.9826612, 1.0234523, 0.9921186,
           1.0029780, 1.0199930, 1.0054256, 1.0152748, 0.9655475,
           0.9919175, 1.0231102, 0.9750882, 0.9958528, 1.0268000,
           0.9651300, 1.0158949, 0.9803130, 1.0385707, 0.9870510,
           1.0211765, 1.0326759, 1.0234579, 0.9524254, 0.9742719,
           0.9887936, 1.0476640, 0.9787385, 0.9992178, 1.0046021,
           0.9929379, 0.9595237, 1.0690364, 0.9910940, 1.0158325,
           0.9799790, 1.0316363, 1.0341890, 1.0036944, 0.9728850,
           1.0080238, 1.0190104, 0.9735436, 0.9744903, 0.9974915,
           0.9804733, 1.0243671, 0.9881085, 0.9923432, 0.9638553,
           1.0178705, 1.0476191, 1.0260725, 1.0474791, 1.0449745,
           0.9987096, 1.0028339, 0.9971751, 0.9487246, 0.9696386)
}


###################################################
### code chunk number 9: SIBER.Rnw:177-178
###################################################
SIBER(y=Dat[1, ], d=1/TMM, model='LN')


###################################################
### code chunk number 10: SIBER.Rnw:250-259
###################################################
data(simDat)
ind <- 1
# true parameter generating the simulated data
parList$LN[ind, ]
# fit by E model
fitLN(y=dataList$LN[ind, ], base=exp(1), eps=1, model='E')
# fit by V model. 
fitLN(y=dataList$LN[ind, ], base=exp(1), eps=1, model='V')



###################################################
### code chunk number 11: SIBER.Rnw:265-275
###################################################
ind <- 5 # 0-inflated gene
# true parameter generating the simulated data
parList$LN[ind, ]
# fit by E model. 0-inflated model is disabled by setting zeroPercentThr=1.
# the result is biased. 
fitLN(y=dataList$LN[ind, ], base=exp(1), eps=1, model='E', zeroPercentThr=1)
# fit by 0-inflated model. 0-inflated model overrides the E model since percentage
# of observed zero counts exceeds the threshold.
fitLN(y=dataList$LN[ind, ], base=exp(1), eps=1, model='E', zeroPercentThr=0.2)



###################################################
### code chunk number 12: sessionInfo
###################################################
getwd()
sessionInfo()


