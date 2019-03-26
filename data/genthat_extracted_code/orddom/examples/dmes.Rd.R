library(orddom)


### Name: dmes
### Title: Dominance Matrix Effect Sizes
### Aliases: dmes
### Keywords: array nonparametric robust

### ** Examples
## Not run: 
##D > #Example from Efron & Tibshirani (1993, Table 2.1, p. 11)
##D > #cf. Efron, B. & Tibshirani (1993). An Introduction to the Bootstrap. New York/London: Chapman&Hall.
##D > y<-c(94,197,16,38,99,141,23) # Treatment Group
##D > x<-c(52,104,146,10,50,31,40,27,46) # Control Group
##D > dmes(x,y)
##D $nx
##D [1] 9
##D 
##D $ny
##D [1] 7
##D 
##D $PSc
##D [1] 0.5714286
##D 
##D $Ac
##D [1] 0.5714286
##D 
##D $dc
##D [1] 0.1428571
##D 
##D $NNTc
##D [1] 7
##D 
##D $PSw
##D [1] 0.5714286
##D 
##D $Aw
##D [1] 0.5714286
##D 
##D $dw
##D [1] 0.1428571
##D 
##D $NNTw
##D [1] 7
##D 
##D $PSb
##D [1] 0.5714286
##D 
##D $Ab
##D [1] 0.5714286
##D 
##D $db
##D [1] 0.1428571
##D 
##D $NNTb
##D [1] 7
##D 
##D > ############################################################################
##D > #Example from Ruscio & Mullen (2012, p. 202)
##D > #Ruscio, J. & Mullen, T. (2012). Confidence Intervals for the Probability of Superiority Effect Size Measure and the Area Under a Receiver Operating Characteristic Curve, Multivariate Behavioral Research, 47, 201-223.
##D > x <- c(6,7,8,7,9,6,5,4,7,8,7,6,9,5,4) # Treatment Group
##D > y <- c(4,3,5,3,6,2,2,1,6,7,4,3,2,4,3) # Control Group
##D > dmes(y,x)
##D $nx
##D [1] 15
##D 
##D $ny
##D [1] 15
##D 
##D $PSc
##D [1] 0.8444444
##D 
##D $Ac
##D [1] 0.8844444
##D 
##D $dc
##D [1] 0.7688889
##D 
##D $NNTc
##D [1] 1.300578
##D 
##D $PSw
##D [1] 1
##D 
##D $Aw
##D [1] 1
##D 
##D $dw
##D [1] 1
##D 
##D $NNTw
##D [1] 1
##D 
##D $PSb
##D [1] 0.8333333
##D 
##D $Ab
##D [1] 0.8761905
##D 
##D $db
##D [1] 0.752381
##D 
##D $NNTb
##D [1] 1.329114
## End(Not run)


