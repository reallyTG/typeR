library(GPoM)


### Name: gPoMo
### Title: Generalized Polynomial Modeling
### Aliases: gPoMo

### ** Examples

#Example 1
data("Ross76")
tin <- Ross76[,1]
data <- Ross76[,3]
dev.new()
out1 <- gPoMo(data, tin = tin, dMax = 2, nS=c(3), show = 1,
              IstepMax = 1000, nPmin = 9, nPmax = 11)
visuEq(3, 2, out1$models$model1, approx = 4)


## Not run: 
##D #Example 2
##D data("Ross76")
##D tin <- Ross76[,1]
##D data <- Ross76[,3]
##D # if some data are not valid (vector 'weight' with zeros)
##D W <- tin * 0 + 1
##D W[1:100] <- 0
##D W[700:1500] <- 0
##D W[2000:2800] <- 0
##D W[3000:3500] <- 0
##D dev.new()
##D out2 <- gPoMo(data, tin = tin, weight = W,
##D                  dMax = 2, nS=c(3), show = 1,
##D                  IstepMax = 6000, nPmin = 9, nPmax = 11)
##D visuEq(3, 2, out2$models$model3, approx = 4)
## End(Not run)


## Not run: 
##D #Example 3
##D data("Ross76")
##D tin <- Ross76[,1]
##D data <- Ross76[,2:4]
##D dev.new()
##D out3 <- gPoMo(data, tin=tin, dMax = 2, nS=c(1,1,1), show = 1,
##D               IstepMin = 10, IstepMax = 3000, nPmin = 7, nPmax = 8)
##D # the simplest model able to reproduce the observed dynamics is model #5
##D visuEq(3, 2, out3$models$model5, approx = 4) # the original Rossler system is thus retrieved
## End(Not run)

## Not run: 
##D #Example 4
##D data("Ross76")
##D tin <- Ross76[,1]
##D data <- Ross76[,2:3]
##D # model template:
##D EqS <- matrix(1, ncol = 3, nrow = 10)
##D EqS[,1] <- c(0,0,0,1,0,0,0,0,0,0)
##D EqS[,2] <- c(1,1,0,1,0,1,1,1,1,1)
##D EqS[,3] <- c(0,1,0,0,0,0,1,1,0,0)
##D visuEq(3, 2, EqS, substit = c('X','Y','Z'))
##D dev.new()
##D out4 <- gPoMo(data, tin=tin, dMax = 2, nS=c(2,1), show = 1,
##D       EqS = EqS, IstepMin = 10, IstepMax = 2000,
##D       nPmin = 9, nPmax = 11)
## End(Not run)

## Not run: 
##D #Example 5
##D # load data
##D data("TSallMod_nVar3_dMax2")
##D #multiple (six) time series
##D tin <- TSallMod_nVar3_dMax2$SprK$reconstr[1:400,1]
##D TSRo76 <- TSallMod_nVar3_dMax2$R76$reconstr[,2:4]
##D TSSprK <- TSallMod_nVar3_dMax2$SprK$reconstr[,2:4]
##D data <- cbind(TSRo76,TSSprK)[1:400,]
##D dev.new()
##D # generalized Polynomial modelling
##D out5 <- gPoMo(data, tin = tin, dMax = 2, nS = c(1,1,1,1,1,1),
##D               show = 0, method = 'rk4',
##D               IstepMin = 2, IstepMax = 3,
##D               nPmin = 13, nPmax = 13)
##D 
##D # the original Rossler (variables x, y and z) and Sprott (variables u, v and w)
##D # systems are retrieved:
##D visuEq(6, 2, out5$models$model347, approx = 4,
##D        substit = c('x', 'y', 'z', 'u', 'v', 'w'))
##D # to check the robustness of the model, the integration duration
##D # should be chosen longer (at least IstepMax = 4000)
## End(Not run)




