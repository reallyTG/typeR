library(SMM)


### Name: estimSM
### Title: Estimation of a semi-Markov chain
### Aliases: estimSM
### Keywords: Estimation Semi-Markov models

### ** Examples

alphabet = c("a","c","g","t")
S = length(alphabet)
# creation of the transition matrix
Pij = matrix(c(0,0.2,0.3,0.5,0.4,0,0.2,0.4,0.1,0.2,0,0.7,0.8,0.1,0.1,0), nrow = S, 
ncol = S, byrow = TRUE)

Pij
#     [,1] [,2] [,3] [,4]
#[1,]  0.0  0.2  0.3  0.5
#[2,]  0.4  0.0  0.2  0.4
#[3,]  0.1  0.2  0.0  0.7
#[4,]  0.8  0.1  0.1  0.0

################################
## Parametric estimation of a trajectory (of length equal to 5000)
## where the sojourn times depend neither on the present state nor on the next state ("f")
################################
## Simulation of a sequence of length 5000
seq5000 = simulSM(E = alphabet, NbSeq = 1, lengthSeq = 5000, TypeSojournTime = "f",
               init = c(1/4,1/4,1/4,1/4), Ptrans = Pij, distr = "pois", param = 2)


## Estimation of the simulated sequence
estSeq5000 = estimSM(seq = seq5000, E = alphabet, TypeSojournTime = "f",
                  distr = "pois", cens.end = 0, cens.beg = 0)

# initial distribution estimated
estSeq5000$init
# [1] 0.3592058 0.1456077 0.1600481 0.3351384

# transition matrix estimated
estSeq5000$Ptrans
#          [,1]       [,2]       [,3]      [,4]
#[1,] 0.0000000 0.21775544 0.30150754 0.4807370
#[2,] 0.4297521 0.00000000 0.18181818 0.3884298
#[3,] 0.1052632 0.23308271 0.00000000 0.6616541
#[4,] 0.8348294 0.08976661 0.07540395 0.0000000

# estimated parameter
estSeq5000$param
# [1] 2.007822 0.000000

# estimated semi-Markov kernel
estSeq5000$q
# , , 1
#           [,1]       [,2]       [,3]       [,4]
#[1,] 0.00000000 0.02924038 0.04048668 0.06455377
#[2,] 0.05770747 0.00000000 0.02441470 0.05215867
#[3,] 0.01413482 0.03129854 0.00000000 0.08884747
#[4,] 0.11210159 0.01205393 0.01012531 0.00000000
#, , 2
#           [,1]       [,2]       [,3]      [,4]
#[1,] 0.00000000 0.05870948 0.08129005 0.1296125
#[2,] 0.11586631 0.00000000 0.04902036 0.1047253
#[3,] 0.02838021 0.06284189 0.00000000 0.1783899
#[4,] 0.22508003 0.02420215 0.02032981 0.0000000
#, , 3
#          [,1]       [,2]       [,3]      [,4]
#[1,] 0.0000000 0.05893909 0.08160797 0.1301194
#[2,] 0.1163195 0.00000000 0.04921208 0.1051349
#[3,] 0.0284912 0.06308767 0.00000000 0.1790876
#[4,] 0.2259603 0.02429681 0.02040932 0.0000000
#, , 4
#           [,1]       [,2]       [,3]       [,4]
#[1,] 0.00000000 0.03944640 0.05461809 0.08708551
#[2,] 0.07784959 0.00000000 0.03293636 0.07036405
#[3,] 0.01906842 0.04222293 0.00000000 0.11985865
#[4,] 0.15122935 0.01626122 0.01365943 0.00000000
#, , 5
#            [,1]        [,2]        [,3]       [,4]
#[1,] 0.000000000 0.019800336 0.027415850 0.04371305
#[2,] 0.039077026 0.000000000 0.016532588 0.03531962
#[3,] 0.009571498 0.021194032 0.000000000 0.06016370
#[4,] 0.075910402 0.008162409 0.006856423 0.00000000
#, , 6
#            [,1]        [,2]        [,3]      [,4]
#[1,] 0.000000000 0.007951110 0.011009229 0.0175536
#[2,] 0.015691942 0.000000000 0.006638898 0.0141831
#[3,] 0.003843573 0.008510768 0.000000000 0.0241596
#[4,] 0.030482913 0.003277733 0.002753295 0.0000000
#, , 7
#            [,1]        [,2]         [,3]        [,4]
#[1,] 0.000000000 0.002660735 0.0036840950 0.005874085
#[2,] 0.005251104 0.000000000 0.0022216210 0.004746190
#[3,] 0.001286202 0.002848018 0.0000000000 0.008084696
#[4,] 0.010200710 0.001096851 0.0009213545 0.000000000
#, , 8
#             [,1]         [,2]         [,3]        [,4]
#[1,] 0.0000000000 0.0007631832 0.0010567152 0.001684874
#[2,] 0.0015061831 0.0000000000 0.0006372313 0.001361358
#[3,] 0.0003689234 0.0008169018 0.0000000000 0.002318947
#[4,] 0.0029258870 0.0003146115 0.0002642737 0.000000000
#, , 9
#             [,1]         [,2]         [,3]         [,4]
#[1,] 0.000000e+00 1.915420e-04 2.652120e-04 0.0004228658
#[2,] 3.780184e-04 0.000000e+00 1.599309e-04 0.0003416705
#[3,] 9.259156e-05 2.050242e-04 0.000000e+00 0.0005820041
#[4,] 7.343325e-04 7.896048e-05 6.632681e-05 0.0000000000

## No test: 
################################
## Parametric estimation of a trajectory (of length equal to 5000), 
## where sojourn times do not depend neither on the present state nor on the next state
## and the sequence is censored at the beginning.
################################
## Simulation of a sequence of length 5000
#seq5000 = simulSM(E = alphabet, NbSeq = 1, lengthSeq = 5000, TypeSojournTime = "f", 
#                init = c(1/4,1/4,1/4,1/4), Ptrans = Pij, distr = "pois", param = 2, 
#                cens.beg = 1, cens.end = 0)
                
                
## Estimation of the simulated sequence                
#estSeq5000 = estimSM(seq = seq5000, E = alphabet, TypeSojournTime = "f", 
#                   distr = "pois", cens.end = 0, cens.beg = 1)


################################
## Parametric estimation of a trajectory (of length equal to 5000), 
## where sojourn times do not depend neither on the present state nor on the next state
## and the sequence is censored at the beginning and at the end
################################
## Simulation of a sequence of legnth 5000
#seq5000 = simulSM(E = alphabet, NbSeq = 1, lengthSeq = 5000, TypeSojournTime = "f", 
#                init = c(1/4,1/4,1/4,1/4), Ptrans = Pij, distr = "pois", param = 2, 
#                cens.beg = 1, cens.end = 1)
                
                
## Estimation of the simulated sequence                
#estSeq5000 = estimSM(seq = seq5000, E = alphabet, TypeSojournTime = "f", 
#                   distr = "pois", cens.end = 1, cens.beg = 1)
                   
################################
## Parametric simulation of several trajectories (3 trajectories of length 1000, 10 000 
## and 2000 respectively),
## where the sojourn times depend on the present state and on the next state
## and the sojourn time distributions are modeled by different distributions.
################################
lengthSeq3 = c(1000, 10000, 2000)
## creation of the initial distribution
vect.init = c(1/4,1/4,1/4,1/4)
## creation of the distribution matrix
distr.matrix = matrix(c("dweibull", "pois", "geom", "nbinom", "geom", "nbinom", 
"pois", "dweibull", "pois", "pois", "dweibull", "geom", "pois","geom", "geom", 
"nbinom"), nrow = S, ncol = S, byrow = TRUE)
## creation of an array containing the parameters
param1.matrix = matrix(c(0.6,2,0.4,4,0.7,2,5,0.6,2,3,0.6,0.6,4,0.3,0.4,4), nrow = S, 
ncol = S, byrow = TRUE)
param2.matrix = matrix(c(0.8,0,0,2,0,5,0,0.8,0,0,0.8,0,4,0,0,4), nrow = S, ncol = S, 
byrow = TRUE)
param.array = array(c(param1.matrix, param2.matrix), c(S,S,2))
### Simulation of 3 sequences
seq3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fij", 
init = vect.init, Ptrans = Pij, distr = distr.matrix, param = param.array, File.out = NULL)
                
## Estimation of the simulated sequence                
estSeq3 = estimSM(seq = seq3, E = alphabet, TypeSojournTime = "fij", 
                   distr = distr.matrix, cens.end = 0, cens.beg = 0)
                   
################################
## Non-Parametric simulation of several trajectories (3 trajectories of length 1000, 10 000 
## and 2000 respectively),
## where the sojourn times depend on the present state and on the next state
################################
lengthSeq3 = c(1000, 10000, 2000)
## creation of the initial distribution
vect.init = c(1/4,1/4,1/4,1/4)
## creation of an array containing the conditional distributions
Kmax = 4 
mat1 = matrix(c(0,0.5,0.4,0.6,0.3,0,0.5,0.4,0.7,0.2,0,0.3,0.4,0.6,0.2,0), nrow = S, 
ncol = S, byrow = TRUE)
mat2 = matrix(c(0,0.2,0.3,0.1,0.2,0,0.2,0.3,0.1,0.4,0,0.3,0.2,0.1,0.3,0), nrow = S, 
ncol = S, byrow = TRUE)
mat3 = matrix(c(0,0.1,0.3,0.1,0.3,0,0.1,0.2,0.1,0.2,0,0.3,0.3,0.3,0.4,0), nrow = S, 
ncol = S, byrow = TRUE)
mat4 = matrix(c(0,0.2,0,0.2,0.2,0,0.2,0.1,0.1,0.2,0,0.1,0.1,0,0.1,0), nrow = S, 
ncol = S, byrow = TRUE)
f <- array(c(mat1,mat2,mat3,mat4), c(S,S,Kmax))
### Simulation of 3 sequences
seq3.NP = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, 
TypeSojournTime = "fij", init = vect.init, Ptrans = Pij, distr = "NP", laws = f, 
File.out = NULL)
                
## Estimation of the simulated sequence                
estSeq3.NP = estimSM(seq = seq3.NP, E = alphabet, TypeSojournTime = "fij", 
                   distr = "NP", cens.end = 0, cens.beg = 0)

                 
# initial distribution estimated
estSeq3.NP$init
# [1] 0.1856190 0.2409524 0.2975714 0.2758571

# transition matrix estimated
estSeq3.NP$Ptrans
#            [,1]       [,2]       [,3]      [,4]
# [1,] 0.00000000 0.20560325 0.29191143 0.5024853
# [2,] 0.40614334 0.00000000 0.19795222 0.3959044
# [3,] 0.08932039 0.21941748 0.00000000 0.6912621
# [4,] 0.81206817 0.09120221 0.09672962 0.0000000

# parameter estimated
estSeq3.NP$laws
#, , 1
#          [,1]      [,2]      [,3]      [,4]
# [1,] 0.0000000 0.4769231 0.4009288 0.6016187
# [2,] 0.3053221 0.0000000 0.4540230 0.3764368
# [3,] 0.7717391 0.2389381 0.0000000 0.2794944
# [4,] 0.4140669 0.5959596 0.2000000 0.0000000
# , , 2
#           [,1]      [,2]      [,3]      [,4]
# [1,] 0.00000000 0.2175824 0.2801858 0.1052158
# [2,] 0.16526611 0.0000000 0.2356322 0.2959770
# [3,] 0.07608696 0.3716814 0.0000000 0.3089888
# [4,] 0.18774816 0.1161616 0.3142857 0.0000000
# , , 3
#           [,1]       [,2]      [,3]       [,4]
# [1,] 0.00000000 0.09450549 0.3188854 0.08363309
# [2,] 0.31092437 0.00000000 0.1034483 0.19540230
# [3,] 0.06521739 0.20353982 0.0000000 0.32022472
# [4,] 0.29892229 0.28787879 0.3666667 0.00000000
#, , 4
#           [,1]      [,2]      [,3]       [,4]
# [1,] 0.00000000 0.2109890 0.0000000 0.20953237
# [2,] 0.21848739 0.0000000 0.2068966 0.13218391
# [3,] 0.08695652 0.1858407 0.0000000 0.09129213
# [4,] 0.09926262 0.0000000 0.1190476 0.00000000

# semi-Markovian kernel estimated
estSeq3.NP$q
# , , 1
#           [,1]       [,2]       [,3]      [,4]
# [1,] 0.00000000 0.09805694 0.11703570 0.3023046
# [2,] 0.12400455 0.00000000 0.08987486 0.1490330
# [3,] 0.06893204 0.05242718 0.00000000 0.1932039
# [4,] 0.33625058 0.05435283 0.01934592 0.0000000
# , , 2
#            [,1]       [,2]       [,3]       [,4]
# [1,] 0.000000000 0.04473565 0.08178943 0.05286941
# [2,] 0.067121729 0.00000000 0.04664391 0.11717861
# [3,] 0.006796117 0.08155340 0.00000000 0.21359223
# [4,] 0.152464302 0.01059420 0.03040074 0.00000000
#, , 3
#            [,1]       [,2]       [,3]       [,4]
# [1,] 0.000000000 0.01943064 0.09308631 0.04202440
# [2,] 0.126279863 0.00000000 0.02047782 0.07736064
# [3,] 0.005825243 0.04466019 0.00000000 0.22135922
# [4,] 0.242745279 0.02625518 0.03546753 0.00000000
#, , 4
#           [,1]       [,2]       [,3]      [,4]
# [1,] 0.00000000 0.04338003 0.00000000 0.1052869
# [2,] 0.08873720 0.00000000 0.04095563 0.0523322
# [3,] 0.00776699 0.04077670 0.00000000 0.0631068
# [4,] 0.08060801 0.00000000 0.01151543 0.0000000

#---------------------------------------------#
alphabet = c("0","1")
S = length(alphabet)
# creation of the transition matrix
Pij = matrix(c(0,1,1,0), nrow = S, ncol = S, byrow = TRUE)
distr = matrix(c("nbinom", "pois", "geom", "geom"), nrow = S, ncol = S, byrow = TRUE)
param = array(c(matrix(c(2,5,0.4,0.7), nrow = S, ncol = S, byrow = TRUE), matrix(c(6,0,0,0), 
nrow = S, ncol = S, byrow = TRUE)), c(S,S,2)) 

################################
## Parametric estimation of a trajectory (of length  equal to 5000) 
## where the state space is {"0","1"}
################################
## Simulation of a sequence of length 5000
seq2 = simulSM(E = alphabet, NbSeq = 2, lengthSeq = c(5000,1000), TypeSojournTime = "fij", 
                init = c(1/2,1/2), Ptrans = Pij, distr = distr, param = param)
                
                
## Estimation of the simulated sequence                
estSeq2 = estimSM(seq = seq2, E = alphabet, TypeSojournTime = "fij", 
                   distr = distr, cens.end = 1, cens.beg = 1)


#---------------------------------------------#

## End(No test)



