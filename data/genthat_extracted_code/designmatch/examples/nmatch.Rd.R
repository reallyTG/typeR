library(designmatch)


### Name: nmatch
### Title: Optimal nonbipartite matching in randomized experiments and
###   observational studies
### Aliases: nmatch
### Keywords: Causal inference Matching Randomized experiment

### ** Examples
    

# Load and attach data
data(lalonde)
attach(lalonde)

################################# 
# Example: optimal subset matching
################################# 

# Optimal subset matching pursues two competing goals at 
# the same time: to minimize the total of distances while 
# matching as many observations as possible.  The trade-off 
# between these two is regulated by the parameter subset_weight 
# (see Rosenbaum 2012 and Zubizarreta et al. 2013 for a discussion).
# Here the balance requirements are mean and fine balance for 
# different covariates.  We require 50 pairs to be matched.
# Again, the solver used is glpk with the approximate option.

# Matrix of covariates
X_mat = cbind(age, education, black, hispanic, married, nodegree, re74, re75)

# Distance matrix
dist_mat_covs = round(dist(X_mat, diag = TRUE, upper = TRUE), 1)
dist_mat = as.matrix(dist_mat_covs)

# Subset matching weight
subset_weight = 1

# Total pairs to be matched
total_pairs = 50

# Moment balance: constrain differences in means to be at most .1 standard deviations apart
mom_covs = cbind(age, education)
mom_tols = apply(mom_covs, 2, sd)*.1
mom = list(covs = mom_covs, tols = mom_tols)

# Solver options
t_max = 60*5
solver = "glpk"
approximate = 1
solver = list(name = solver, t_max = t_max, approximate = approximate, round_cplex = 0, 
trace_cplex = 0)

# Match                  
out = nmatch(dist_mat = dist_mat, subset_weight = subset_weight, total_pairs = total_pairs, 
mom = mom, solver = solver)              
              
# Indices of the treated units and matched controls
id_1 = out$id_1  
id_2 = out$id_2	

# Assess mean balance
a = apply(mom_covs[id_1, ], 2, mean)
b = apply(mom_covs[id_2, ], 2, mean)
tab = round(cbind(a, b, a-b, mom_tols), 2)
colnames(tab) = c("Mean 1", "Mean 2", "Diffs", "Tols")
tab

## Assess fine balance (note here we are getting an approximate solution)
#for (i in 1:ncol(fine_covs)) {		
#	print(finetab(fine_covs[, i], id_1, id_2))
#}



