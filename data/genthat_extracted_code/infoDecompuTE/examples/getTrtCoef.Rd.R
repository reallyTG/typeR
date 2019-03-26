library(infoDecompuTE)


### Name: getTrtCoef
### Title: Get the Treatment Coefficients
### Aliases: getTrtCoef

### ** Examples


design1 <- local({ 
  Ani = as.factor(LETTERS[c(1,2,3,4,
                            5,6,7,8)])
  Trt = as.factor(letters[c(1,1,1,1,
                            2,2,2,2)])
  data.frame(Ani, Trt)
})

trt.str = "Trt"
  
fT = terms(as.formula(paste("~", trt.str, sep = "")), keep.order = TRUE)  #fixed terms

trtTerm = attr(fT,"term.labels")
effectsMatrix = attr(fT,"factor") 
		
trt.Coef = getTrtCoef(design1, trtTerm)





