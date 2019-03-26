library(infoDecompuTE)


### Name: summaryAovOnePhase
### Title: Summarize an Theoretical Analysis of Variance Model of
###   Single-Phase Experiments
### Aliases: summaryAovOnePhase
### Keywords: design

### ** Examples


design1 <- local({ 
  Ani = as.factor(LETTERS[c(1,2,3,4,
                            5,6,7,8)])
  Trt = as.factor(letters[c(1,1,1,1,
                            2,2,2,2)])
  data.frame(Ani, Trt)
})

summaryAovOnePhase(design1, blk.str = "Ani", trt.str = "Trt") 

summaryAovOnePhase(design1, blk.str = "Ani", trt.str = "Trt", 
latex = TRUE, fixed.names = c("\\tau"))





