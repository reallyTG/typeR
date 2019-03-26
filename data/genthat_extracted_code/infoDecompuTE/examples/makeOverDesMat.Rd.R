library(infoDecompuTE)


### Name: makeOverDesMat
### Title: Construct the Overall Treatment or Block design Matrix
### Aliases: makeOverDesMat

### ** Examples


design1 <- local({ 
  Ani = as.factor(LETTERS[c(1,2,3,4,
                            5,6,7,8)])
  Trt = as.factor(letters[c(1,1,1,1,
                            2,2,2,2)])
  data.frame(Ani, Trt)
})

trt.str = "Trt"
  
fT = terms(as.formula(paste("~", trt.str, sep = "")), keep.order = TRUE) 

trtTerm = attr(fT,"term.labels")
effectsMatrix = attr(fT,"factor") 
    
makeOverDesMat(design1, trtTerm)
       





