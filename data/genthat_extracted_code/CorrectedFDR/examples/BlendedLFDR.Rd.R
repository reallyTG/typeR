library(CorrectedFDR)


### Name: BlendedLFDR
### Title: Blended Estimator of Local False Discovery Rate (LFDR)
### Aliases: BlendedLFDR
### Keywords: BBE1 Blended CFDR False Discovery Rate LFDR MLE NFDR RFDR

### ** Examples

#The data used to compute the LFDR estimators (CFDR, RFDR, MLE, and BBE1)
#comes from the ER/PR breast cancer data from the "ProData" package.
#To read more about the data, visit the website: https://www.bioconductor.org/
#Test statistics were first obtain, then the estimators for the FDR and LFDR were estimated.
#Benchmark vector
NFDR<-c(0.5661106448, 0.6897735492, 0.0000288516, 0.1549745113, 0.1305508970, 0.2421032979,
0.1482335568, 1, 1, 1, 0.6602562820, 0.7034682859, 0.7036332234, 0.0071192090,
0.8204536037, 0.9757716498, 0.7379329991, 1, 0.6333245479, 0.9904389701)
#Estimators of LFDR
CFDR<- c(1, 1, 0.0000288516, 0.2841199373, 0.2980912149, 0.5931530799, 0.3088199101,
1, 1, 1, 1, 1, 1, 0.0106788135, 1, 1, 1, 1, 1, 1)

RFDR<- c(0.689773549, 1, 0.007119209, 0.130550897, 0.703633223, 0.660256282, 0.242103298,
1, 1, 1, 0.820453604, 1, 0.703468286, 0.154974511, 1, 1, 1, 1, 0.975771650,1)

MLE<- c(0.9865479126, 0.9969935995, 0.0002372158, 0.6531633437, 0.7611453549, 0.9187425383,
0.7359259207, 0.9996548155, 0.9997310453, 0.9997437131, 0.9944712582, 0.9981685029,
0.9937604664, 0.0215892618, 0.9990504315, 0.9997493086, 0.9967673540, 0.9997016985,
0.9970142319, 0.9997625673)

BBE1<- c(1,1, 0.0003169812, 0.1138333734, 1, 1, 1, 1, 1, 1, 0.3279109564, 1, 0.0504755806,
0.0091823115, 0.0182614994, 0.0165386682, 1, 0.6964403713, 0.1001337298, 0.8415641198 )

#Matrix of LFDR Estimators
Est.LFDR<- matrix(c(CFDR,RFDR,MLE,BBE1), ncol=4)
output<-BlendedLFDR(Benchmark = NFDR, EstLFDR = Est.LFDR)
output$Blended



