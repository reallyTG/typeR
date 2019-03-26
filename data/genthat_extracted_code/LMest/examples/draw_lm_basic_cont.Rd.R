library(LMest)


### Name: draw_lm_basic_cont
### Title: Draw samples from the basic LM model for continuous outcomes
### Aliases: draw_lm_basic_cont

### ** Examples

# draw a sample for 1000 units and 3 response variable
n = 1000
TT = 5
k = 2
r = 3 #number of response variables

piv = c(0.7,0.3)
Pi = matrix(c(0.9,0.1,0.1,0.9),k,k)
Pi = array(Pi,c(k,k,TT))
Pi[,,1] = 0
Mu  = matrix(c(-2,-2,0,0,2,2),r,k)
Si = diag(r)
out = draw_lm_basic_cont(piv,Pi,Mu,Si,n)



