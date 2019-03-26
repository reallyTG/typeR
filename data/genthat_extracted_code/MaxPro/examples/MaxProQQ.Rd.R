library(MaxPro)


### Name: MaxProQQ
### Title: Maximum Projection Designs with Quantitative and Qualitative
###   Factors
### Aliases: MaxProQQ
### Keywords: Design of Experiments Computer Experiments

### ** Examples

#18-run design
#3 continuous factors, 1 discrete numeric factor (6 levels), 2 nominal factors (3 levels)

#Generate a random Latin hypercube design (each factor standardized into [0,1]) 
#as the initial design for continuous factors
rand_design_part1=apply(matrix(rep(seq(from=0,to=1,length=18),3),ncol=3),2,sample)

#Generate a random initial design (standardized into [0,1]) for discrete numeric factors
rand_design_part2=sample(rep(seq(from=0,to=1,length=6),each=3))

#Construct an optimal design for the two nominal factors
OA_matrix=cbind(rep(1:3,each=6),rep(1:3,6))

#Initial design matrix
InitialDesign=cbind(rand_design_part1,rand_design_part2,OA_matrix)

#Optimize the design based on MaxProQQ criterion
obj=MaxProQQ(InitialDesign, p_nom=2) 
obj$Design





