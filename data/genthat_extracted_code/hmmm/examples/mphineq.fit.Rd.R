library(hmmm)


### Name: mphineq.fit
### Title: fit mph models under inequality constraints
### Aliases: mphineq.fit
### Keywords: models

### ** Examples

y <- c(104,24,65,76,146,30,50,9,166) # Table 2 (Lang, 2004)
y <- matrix(y,9,1)

# population matrix: 3 strata with 3 observations each
Z <- kronecker(diag(3),matrix(1,3,1))
# the 3rd stratum sample size is fixed
ZF <- kronecker(diag(3),matrix(1,3,1))[,3]

########################################################################
# Let (i,j) be a cross-citation, where i is the citing journal and j is 
# the cited journal. Let m_ij be the expected counts of cross-citations.
# The Gini concentrations of citations for each of the journals are: 
# G_i = sum_j=1_3 (m_ij/m_i+)^2  for i=1,2,3.

 
Gini<-function(m) {
 A<-matrix(m,3,3,byrow=TRUE)
 GNum<-rowSums(A^2)
 GDen<-rowSums(A)^2
 G<-GNum/GDen
 c(G[1],G[2],G[3])-c(0.410,0.455,0.684)
 }


# h_1 = c(G1,G2,G3)-c(0.410,0.455,0.684) = 0
# HYPOTHESIS: no change in Gini concentrations
# from the 1987-1989 observed values

mod_eq <- mphineq.fit(y,Z,ZF,h.fct=Gini)

print(mod_eq)

# Example of MPH model subject to inequality constraints

# d_1 = c(G1,G2,G3)-c(0.410,0.455,0.684) >= 0
# HYPOTHESIS: increase in Gini concentrations
# from the 1987-1989 observed values

mod_ineq <- mphineq.fit(y,Z,ZF,d.fct=Gini)


# Reference model: model without inequalities --> saturated model
mod_sat <-mphineq.fit(y,Z,ZF)


# HYPOTHESES TESTED:
# NB: testA --> H0=(mod_eq) vs H1=(mod_ineq model)
# testB --> H0=(mod_ineq model) vs H1=(sat_mod model)

hmmm.chibar(nullfit=mod_eq,disfit=mod_ineq,satfit=mod_sat)



