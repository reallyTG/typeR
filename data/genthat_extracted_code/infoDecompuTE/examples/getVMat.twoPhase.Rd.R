library(infoDecompuTE)


### Name: getVMat.twoPhase
### Title: Get the Variance Matrices for Two-Phase experiment
### Aliases: getVMat.twoPhase

### ** Examples

     design2 <- local({ 
  Run = as.factor(rep(1:4, each = 4))
  Ani = as.factor(LETTERS[c(1,2,3,4,
                            5,6,7,8,
                            3,4,1,2,
                            7,8,5,6)])
  Tag = as.factor(c(114,115,116,117)[rep(1:4, 4)])
  Trt = as.factor(letters[c(1,2,1,2,
                            2,1,2,1,
                            1,2,1,2,
                            2,1,2,1)])
  data.frame(Run, Ani, Tag, Trt)
})

    blk.str1 = "Ani"
    blk.str2 = "Run"
   
	rT1 = terms(as.formula(paste("~", blk.str1, sep = "")), keep.order = TRUE) 
	#random terms phase 1
	rT2 = terms(as.formula(paste("~", blk.str2, sep = "")), keep.order = TRUE) 
	#random terms phase 2

	blkTerm1 = attr(rT1,"term.labels")
	blkTerm2 = attr(rT2,"term.labels")

	Z1 = makeBlkDesMat(design2, rev(blkTerm1))
	Z2 = makeBlkDesMat(design2, rev(blkTerm2))

	V = getVMat.twoPhase(Z1, Z2, design2, var.comp = NA)



