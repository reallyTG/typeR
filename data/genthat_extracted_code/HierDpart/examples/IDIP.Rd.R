library(HierDpart)


### Name: IDIP
### Title: Function to decompose diversity (genetic or species diversity)
###   and differentiation into different hierarchical levels
### Aliases: IDIP
### Keywords: Hierarchical structure decomposition

### ** Examples

str=Str(nreg=4,r=c(7,4,2,3),n=16)
abu=matrix(data=runif(16*3,min=0,max=1),nrow = 20,ncol = 16)
IDIP(abu,str)



