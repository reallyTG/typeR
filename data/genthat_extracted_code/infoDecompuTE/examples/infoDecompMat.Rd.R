library(infoDecompuTE)


### Name: infoDecompMat
### Title: Construct the Matrix from Information Decomposition
### Aliases: infoDecompMat

### ** Examples


design1 <- local({ 
  Ani = as.factor(LETTERS[c(1,2,3,4,
                            5,6,7,8)])
  Trt = as.factor(letters[c(1,1,1,1,
                            2,2,2,2)])
  data.frame(Ani, Trt)
})

blk.str = "Ani"
    
rT = terms(as.formula(paste("~", blk.str, sep = "")), keep.order = TRUE) 
blkTerm = attr(rT,"term.labels")
     
Z = makeBlkDesMat(design1, blkTerm)
Pb = makeOrthProjectors(Z)

trt.str = "Trt"              
fT <- terms(as.formula(paste("~", trt.str, sep = "")), keep.order = TRUE)  #fixed terms

trtTerm <- attr(fT, "term.labels")
effectsMatrix <- attr(fT, "factors")        

T <- makeContrMat(design1, trtTerm, effectsMatrix, contr.vec = NA)

N =  makeOverDesMat(design1, trtTerm)


infoDecompMat(Pb[[1]], T, N)





