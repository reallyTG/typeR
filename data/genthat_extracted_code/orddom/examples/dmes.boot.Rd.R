library(orddom)


### Name: dmes.boot
### Title: Dominance Matrix Effect Sizes
### Aliases: dmes.boot
### Keywords: array nonparametric robust

### ** Examples
## Not run: 
##D > # cf. Efron & Tibshirani (1993, Ch. 14) 
##D > # Spatial Test Data (Table 14.1, p.180)
##D > A<-c(48,36,20,29,42,42,20,42,22,41,45,14,6,0,33,28,34,4,32,24,47,41,24,26,30,41)
##D > B<-c(42,33,16,39,38,36,15,33,20,43,34,22,7,15,34,29,41,13,38,25,27,41,28,14,28,40)
##D > dmes.boot(A,B)
##D $theta
##D          dc 
##D -0.08136095 
##D 
##D $theta.SE
##D [1] 0.1656658
##D 
##D $bci.meth
##D [1] "BCA"
##D 
##D $theta.bci.lo
##D [1] -0.4008876
##D 
##D $theta.bci.up
##D [1] 0.2440828
##D 
##D $Coh.d
##D [1] -0.06364221
##D 
##D $Coh.d.bSE
##D [1] 0.2895718
##D 
##D $Coh.d.bci.lo
##D [1] -0.6106167
##D 
##D $Coh.d.bci.up
##D [1] 0.5031792
## End(Not run)
## Not run: 
##D > ############################################################################
##D > #Example from Ruscio & Mullen (2012, p. 202)
##D > x <- c(6,7,8,7,9,6,5,4,7,8,7,6,9,5,4) # Treatment Group
##D > y <- c(4,3,5,3,6,2,2,1,6,7,4,3,2,4,3) # Control Group
##D > dmes.boot(y,x,theta.es="Ac")          #AUC
##D $theta
##D        Ac 
##D 0.8844444 
##D 
##D $theta.SE
##D [1] 0.05910963
##D 
##D $bci.meth
##D [1] "BCA"
##D 
##D $theta.bci.lo
##D [1] 0.7022222
##D 
##D $theta.bci.up
##D [1] 0.9644444
##D 
##D $Coh.d
##D [1] 1.727917
##D 
##D $Coh.d.bSE
##D [1] 0.4932543
##D 
##D $Coh.d.bci.lo
##D [1] 0.7753663
##D 
##D $Coh.d.bci.up
##D [1] 2.573305
## End(Not run)


