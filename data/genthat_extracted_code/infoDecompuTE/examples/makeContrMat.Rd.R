library(infoDecompuTE)


### Name: makeContrMat
### Title: Make Contrast Matrix
### Aliases: makeContrMat

### ** Examples


design1 <- local({ 
  Ani = as.factor(LETTERS[c(1,2,3,4,
                            5,6,7,8)])
  Trt = as.factor(letters[c(1,1,1,1,
                            2,2,2,2)])
  data.frame(Ani, Trt)
})

trt.str = "Trt"              
fT <- terms(as.formula(paste("~", trt.str, sep = "")), keep.order = TRUE)  #fixed terms

trtTerm <- attr(fT, "term.labels")
effectsMatrix <- attr(fT, "factor")        

T <- makeContrMat(design1, trtTerm, effectsMatrix, contr.vec = NA)
		
#Fit each treatment contrasts as a vector seperately
Trt1 <- rep(c(1,-1), each = 4)
Trt2 <-  rep(c(1,-1), time = 4)
Trt3 <- Trt1*Trt2
  
T <- makeContrMat(design1, trtTerm, effectsMatrix, 
      contr.vec =list(Trt = list(Trt1 = Trt1, Trt2 = Trt2, Trt3 = Trt3)))





