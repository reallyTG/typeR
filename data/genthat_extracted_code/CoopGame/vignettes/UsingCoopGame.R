## ----eval=TRUE, echo=FALSE-----------------------------------------------
child_docs <- list.files(path="chapters",recursive = TRUE, pattern=".Rmd", full.names = TRUE)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
(v <- c(0,0,0,100,115,125,220))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
(Maschler <- c(0,0,0,60,60,60,72))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v <- c(30,40,50,90,100,110,180)
(w <- getZeroNormalizedGameVector(v))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v <- c(30,40,50,90,100,110,180)
(w01 <- getZeroOneNormalizedGameVector(v))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
(Maschler <- c(0,0,0,60,60,60,72))
createBitMatrix(n=3,Maschler)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v <- c(3,4,5,9,10,11,18)
(MC <- getMarginalContributions(v))
# Look at all the permutations computed
MC$combinations
# Look at the matrix of marginal values 
# corresponding to these permutations
MC$marginal_values

## ---- collapse=TRUE------------------------------------------------------
MC$marginal_values[2,]

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v <- c(3,4,5,9,10,11,18)
# Compute dual game vector
(vStar <- getDualGameVector(v))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v <- c(3,4,5,9,10,11,18)
# Compute utopia payoff vector for specified game v
(M <- getUtopiaPayoff(v))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v <- c(2,3,4,8,9,10,13)
# Compute minimal rights vector for specified game v
(m <- getMinimalRights(v))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
A <-c(3,4,5,9,10,11,18)
x <-c(5,6,7)
# Compute vector of excess coefficients for specified game v
(ec <- getExcessCoefficients(A,x))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
A <-c(3,4,5,9,10,11,18)
# Compute vector of gap function coefficients for specified game v
(gap <- getGapFunctionCoefficients(A))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
A <-c(3,4,5,9,10,11,18)
x <-c(5,6,7)
# Compute vector of per capita excess coefficients for specified game v
(ecpc <- getPerCapitaExcessCoefficients(A,x))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
A <-c(3,4,5,9,10,11,18)
x <-c(5,6,7)
# Compute vector of propensities to disrupt for specified game v
(propVec <- getVectorOfPropensitiesToDisrupt(A,x))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
# Define a simple game
A <-c(0,0,0,1,1,0,1)
# Find the minimum winning coalitions
getMinimumWinningCoalitions(A)
# Find the coalitions where player 2 is critical
getCriticalCoalitionsOfPlayer(2,A)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
A <-c(0,0,0,0.8,0.9,0,0.9)
# Find the real gaining coalitions
getRealGainingCoalitions(A)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
# The Maschler game
Maschler <-c(0,0,0,60,60,60,72)
# Find the unanimity coefficients for the Maschler game
(unCoeff <- getUnanimityCoefficients(Maschler))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
# Example from book by T. Driessen, p. 75
A=c(0,0,0,9,9,15,18)
# Compute 1-cover of this 1-convex game
(A1 <- getkCover(A,k=1))

## ---- collapse=TRUE,eval=FALSE-------------------------------------------
#  library(CoopGame)
#  bankruptcyGame(n=3,d=c(100,200,300),E=300)
#  ## $n
#  ## [1] 3
#  ##
#  ## $d
#  ## [1] 100 200 300
#  ##
#  ## $E
#  ## [1] 300
#  ##
#  ## $v
#  ## [1]   0   0   0   0 100 200 300

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
# First approach
bankruptcyGameVector(n=3,d=c(100,200,300),E=300)
#
# Alternative approach
bankruptcyGame(n=3,d=c(100,200,300),E=300)$v

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
bankruptcyGameValue(S=c(2,3),d=c(100,200,300),E=300)

## ---- collapse=TRUE, eval=FALSE------------------------------------------
#  library(CoopGame)
#  TVACosts=c(163520,140826,250096,301607,378821,367370,412584)
#  (tvaCostGame <- costSharingGame(n=3, TVACosts))
#  ## $n
#  ## [1] 3
#  ##
#  ## $Costs
#  ## [1] 163520 140826 250096 301607 378821 367370 412584
#  ##
#  ## $v
#  ## [1] 0 0 0 2739 34795 23552 141858
#  #
#  # Alternatively, generate and output only the corresponding game vector
#  (v <- costSharingGameVector(n=3, TVACosts))
#  ## [1] 0 0 0 2739 34795 23552 141858

## ---- collapse = TRUE----------------------------------------------------
library(CoopGame)
gloveGame(n=3,L=c(1,3),R=2)$v
#
# Equivalent alternative approach
gloveGameVector(n=3,L=c(1,3),R=2)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
cardinalityGame(4)$v
#
# Equivalent alternative approach
cardinalityGameVector(4)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
weightedVotingGame(n=3, w=c(3,5,4), q=8)$v
#
# Equivalent alternative approach
weightedVotingGameVector(n=3, w=c(3,5,4), q=8)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
majoritySingleVetoGame(n=4, vetoPlayer=2)$v
#
# Equivalent alternative approach
majoritySingleVetoGameVector(n=4, vetoPlayer=2)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
unanimityGame(n=4, T=c(1,4))$v
#
# Equivalent alternative approach 
unanimityGameVector(n=4, T=c(1,4))

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
apexGame(n=4, apexPlayer=2)$v
#
# Equivalent alternative approach 
apexGameVector(n=4, apexPlayer=2)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
dictatorGame(n=4, dictator=3)$v
#
# Equivalent alternative approach 
dictatorGameVector(n=4, dictator=3)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
divideTheDollarGame(3)$v
#
# Equivalent alternative approach
divideTheDollarGameVector(3)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
A <-c(0,0,0,1,1,0,1)
isSuperadditiveGame(A)

## ---- collapse=TRUE------------------------------------------------------
# The following game is 2-convex
library(CoopGame)
alpha = 0.48
v=c(0,0,0,alpha,alpha,0,1)
iskConvexGame(v,2)
# The following game is not 2-convex
library(CoopGame)
alpha = 0.52
v=c(0,0,0,alpha,alpha,0,1)
iskConvexGame(v,2)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v <-c(0,0,0,1,1,0,1)
imputationsetVertices(v)
belongsToImputationset(c(0.7,0.3,0),v)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v <-c(0,0,0,1,1,0,3)
coreVertices(v)
belongsToCore(c(1.7,1.3,0),v)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
Aumann2010Example<-c(120,60,40,30,120,120,120,60,60,40,120,120,120,60,120)
shapleyValue(Aumann2010Example)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
v100 = bankruptcyGameVector(n=3,d=c(100,200,300),E=100)
nucleolus(v100)
v200 = bankruptcyGameVector(n=3,d=c(100,200,300),E=200)
nucleolus(v200)
v300 = bankruptcyGameVector(n=3,d=c(100,200,300),E=300)
nucleolus(v300)

## ---- collapse=TRUE------------------------------------------------------
library(CoopGame)
TVACosts=c(163520,140826,250096,301607,378821,367370,412584)
(v <- costSharingGameVector(n=3, TVACosts))
TVACosts[1:3] - gatelyValue(v)
TVACosts[1:3] - shapleyValue(v)
TVACosts[1:3] - nucleolus(v)
TVACosts[1:3] - tauValue(v)

## ---- collapse=TRUE, eval=FALSE------------------------------------------
#  library(CoopGame)
#  v<-weightedVotingGameVector(n=5, w=c(6,4,1,1,1), q=9)
#  normalizedBanzhafIndex(v)
#  ## [1] 0.47368421 0.36842105 0.05263158 0.05263158 0.05263158
#  deeganPackelIndex(v)
#  ## [1] 0.375 0.250 0.125 0.125 0.125
#  publicGoodIndex(v)
#  ## [1] 0.3333333 0.1666667 0.1666667 0.1666667 0.1666667
#  johnstonIndex(v)
#  ## [1] 0.52777778 0.38888889 0.02777778 0.02777778 0.02777778
#  publicHelpIndex(v)
#  ## [1] 0.28125 0.25000 0.15625 0.15625 0.15625
#  publicHelpChiIndex(v)
#  ## [1] 0.3234568 0.3003086 0.1254115 0.1254115 0.1254115
#  #
#  # Now player 1 donates one vote to player 2
#  v<-weightedVotingGameVector(n=5, w=c(5,5,1,1,1), q=9)
#  normalizedBanzhafIndex(v)
#  ## [1] 0.5 0.5 0.0 0.0 0.0
#  deeganPackelIndex(v)
#  ## [1] 0.5 0.5 0.0 0.0 0.0
#  publicGoodIndex(v)
#  ## [1] 0.5 0.5 0.0 0.0 0.0
#  johnstonIndex(v)
#  ## [1] 0.5 0.5 0.0 0.0 0.0
#  publicHelpIndex(v)
#  ## [1] 0.2857143 0.2857143 0.1428571 0.1428571 0.1428571
#  publicHelpChiIndex(v)
#  ## [1] 0.3309524 0.3309524 0.1126984 0.1126984 0.1126984

## ---- collapse=TRUE, eval=FALSE------------------------------------------
#  library(CoopGame)
#  v<-weightedVotingGameVector(n=10, w=c(9,8,7,0,1,1,1,1,1,1), q=23)
#  normalizedBanzhafIndex(v)
#  ## [1] 0.326633166 0.326633166 0.316582915 0.000000000 0.005025126
#  ## [6] 0.005025126 0.005025126 0.005025126 0.005025126 0.005025126
#  deeganPackelIndex(v)
#  ## [1] 0.2291667 0.2291667 0.1666667 0.0000000 0.0625000 0.0625000
#  ## [7] 0.0625000 0.0625000 0.0625000 0.0625000
#  publicGoodIndex(v)
#  ## [1] 0.18181818 0.18181818 0.09090909 0.00000000 0.09090909
#  ## [6] 0.09090909 0.09090909 0.09090909 0.09090909 0.09090909
#  johnstonIndex(v)
#  ## [1] 0.332692308 0.332692308 0.323076923 0.000000000 0.001923077
#  ## [6] 0.001923077 0.001923077 0.001923077 0.001923077 0.001923077
#  publicHelpIndex(v)
#  ## [1] 0.15312132 0.15312132 0.15076561 0.07656066 0.07773852
#  ## [6] 0.07773852 0.07773852 0.07773852 0.07773852 0.07773852
#  publicHelpChiIndex(v)
#  ## [1] 0.16914603 0.16914603 0.16780487 0.06991541 0.07066461
#  ## [6] 0.07066461 0.07066461 0.07066461 0.07066461 0.07066461
#  #
#  # Now player 1 donates one vote to player 4
#  v<-weightedVotingGameVector(n=10, w=c(8,8,7,1,1,1,1,1,1,1), q=23)
#  normalizedBanzhafIndex(v)
#  ## [1] 0.32908163 0.32908163 0.32397959 0.00255102 0.00255102
#  ## [6] 0.00255102 0.00255102 0.00255102 0.00255102 0.00255102
#  deeganPackelIndex(v)
#  ## [1] 0.22222222 0.22222222 0.16666667 0.05555556 0.05555556
#  ## [6] 0.05555556 0.05555556 0.05555556 0.05555556 0.05555556
#  publicGoodIndex(v)
#  ## [1] 0.16666667 0.16666667 0.08333333 0.08333333 0.08333333
#  ## [6] 0.08333333 0.08333333 0.08333333 0.08333333 0.08333333
#  johnstonIndex(v)
#  ## [1] 0.3329026701 0.3329026701 0.3281653747 0.0008613264 0.0008613264
#  ## [6] 0.0008613264 0.0008613264 0.0008613264 0.0008613264 0.0008613264
#  publicHelpIndex(v)
#  ## [1] 0.15338882 0.15338882 0.15219976 0.07728894 0.07728894 0.07728894
#  ## [7] 0.07728894 0.07728894 0.07728894 0.07728894
#  publicHelpChiIndex(v)
#  ## [1] 0.16941222 0.16941222 0.16881669 0.07033698 0.07033698 0.07033698
#  ## [7] 0.07033698 0.07033698 0.07033698 0.07033698

## ---- collapse=TRUE, eval=FALSE------------------------------------------
#  library(CoopGame)
#  v<-weightedVotingGameVector(n=8, w=c(277,198,68,40,39,27,15,68), q=367)
#  shapleyShubikIndex(v)
#  ## [1] 0.426190476 0.178571429 0.111904762 0.059523810 0.059523810
#  ## [6] 0.045238095 0.007142857 0.111904762
#  normalizedBanzhafIndex(v)
#  ## [1] 0.427272727 0.154545455 0.118181818 0.063636364 0.063636364
#  ## [6] 0.045454545 0.009090909 0.118181818
#  johnstonIndex(v)
#  ## [1] 0.621621622 0.129129129 0.077477477 0.033483483 0.033483483
#  ## [6] 0.023273273 0.004054054 0.077477477
#  deeganPackelIndex(v)
#  ## [1] 0.2222222 0.1066667 0.1488889 0.1211111 0.1211111 0.1011111
#  ## [7] 0.0300000 0.1488889
#  publicGoodIndex(v)
#  ## [1] 0.18518519 0.11111111 0.14814815 0.12962963 0.12962963 0.11111111
#  ## [7] 0.03703704 0.14814815

## ---- collapse=TRUE, fig.show=TRUE---------------------------------------
library(CoopGame)
v0=c(6,8,10,18,20,22,31)
drawImputationset(v0, label=FALSE)
drawReasonableSet(v0, colour="blue", holdOn=TRUE)
drawCore(v0, holdOn=TRUE, colour="red")
drawModiclus(v0, holdOn=TRUE, colour="black")

## ---- collapse=TRUE, fig.show=TRUE---------------------------------------
library(CoopGame)
v0=c(6,8,10,18,20,22,31)
drawReasonableSet(v0, colour="blue")
drawCore(v0, holdOn=TRUE, colour="red")
drawModiclus(v0, holdOn=TRUE, colour="black")

## ---- collapse=TRUE, fig.show=FALSE, eval=FALSE--------------------------
#  #library(CoopGame)
#  #A=c(0,0,0,0,8,8,8,8,8,8,12,12,12,12,22)
#  #drawWeberset(A, colour ="grey")
#  #drawCore(A, colour ="red", holdOn = TRUE)

