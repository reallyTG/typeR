library(LMest)


### Name: draw_lm_basic
### Title: Draw samples from the basic LM model
### Aliases: draw_lm_basic

### ** Examples

# draw a sample for 1000 units and only one response variable
n = 1000
TT = 6
k = 2
r = 1 #number of response variables
mb = 3 #maximum number of response categories

piv = c(0.7,0.3)
Pi = matrix(c(0.9,0.1,0.1,0.9),k,k)
Pi = array(Pi,c(k,k,TT))
Pi[,,1] = 0
Psi = matrix(c(0.7,0.2,0.1,0.5,0.4,0.1),mb,k)
Psi = array(Psi,c(mb,k,r))
out = draw_lm_basic(piv, Pi, Psi, n=1000)



