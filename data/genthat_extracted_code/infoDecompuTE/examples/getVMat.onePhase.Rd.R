library(infoDecompuTE)


### Name: getVMat.onePhase
### Title: Get the Variance Matrices for Single-Phase experiment
### Aliases: getVMat.onePhase

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
		Z = makeBlkDesMat(design1, rev(attr(rT,"term.labels")))

    V = getVMat.onePhase(Z, design1)
    




