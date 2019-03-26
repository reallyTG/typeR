library(infoDecompuTE)


### Name: getCoefVC.onePhase
### Title: Get Variance Components' Coefficients and Mean Squares for
###   Single-Phase or Two-Phase Experiments
### Aliases: getCoefVC.onePhase

### ** Examples


design1 <- local({ 
  Ani <- as.factor(LETTERS[c(1,2,3,4,
                            5,6,7,8)])
  Trt <- as.factor(letters[c(1,1,1,1,
                            2,2,2,2)])
  data.frame(Ani, Trt)
})

blk.str <- "Ani"
    
rT <- terms(as.formula(paste("~", blk.str, sep = "")), keep.order = TRUE) 
blkTerm <- attr(rT,"term.labels")
     
Z <- makeBlkDesMat(design1, blkTerm)

trt.str <- "Trt"              
fT <- terms(as.formula(paste("~", trt.str, sep = "")), keep.order = TRUE)  #fixed terms

trtTerm <- attr(fT, "term.labels")
effectsMatrix <- attr(fT, "factor")        

T <- makeContrMat(design1, trtTerm, effectsMatrix, contr.vec = NA)

N =  makeOverDesMat(design1, trtTerm)

Replist = getTrtRep(design1, trtTerm)   
 
Rep <- Replist$Rep
trt.Sca <- Replist$Sca
    
effFactors = lapply(makeOrthProjectors(Z), function(z) 
      getEffFactor(z, T, N, Rep, trt.Sca))

#Now construct variance matrices
Pb <- effFactors[sort(1:length(effFactors), decreasing=TRUE)]

v.mat <- getVMat.onePhase(Z.Phase1 = Z, design.df = design.df, var.comp = NA)
    
getCoefVC.onePhase(Pb = Pb, design.df = design1, v.mat = v.mat, response = NA, 
    table.legend = FALSE, decimal = FALSE, digit = 2)




