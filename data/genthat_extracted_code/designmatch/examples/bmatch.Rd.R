library(designmatch)


### Name: bmatch
### Title: Optimal bipartite matching in observational studies
### Aliases: bmatch
### Keywords: Causal inference Instrumental variable Matching Regression
###   discontinuity Observational study

### ** Examples

	
# Load, sort, and attach data
data(lalonde)
lalonde = lalonde[order(lalonde$treatment, decreasing = TRUE), ]
attach(lalonde)

################################# 
# Example 1: cardinality matching
################################# 

# Cardinality matching finds the largest matched sample of pairs that meets balance 
# requirements.  Here the balance requirements are mean balance, fine balance and 
# exact matching for different covariates. The solver used is glpk with the 
# approximate option.

# Treatment indicator; note that the data needs to be sorted in decreasing order
# according to this treatment indicator
t_ind = treatment
t_ind 

# Distance matrix
dist_mat = NULL 

# Subset matching weight
subset_weight = 1

# Moment balance: constrain differences in means to be at most .05 standard deviations apart
mom_covs = cbind(age, education, black, hispanic, married, nodegree, re74, re75)
mom_tols = round(absstddif(mom_covs, t_ind, .05), 2)
mom = list(covs = mom_covs, tols = mom_tols)

# Fine balance
fine_covs = cbind(black, hispanic, married, nodegree)
fine = list(covs = fine_covs)

# Exact matching
exact_covs = cbind(black)
exact = list(covs = exact_covs)

# Solver options
t_max = 60*5
solver = "glpk"
approximate = 1
solver = list(name = solver, t_max = t_max, approximate = approximate,
round_cplex = 0, trace = 0)

# Match                   
out = bmatch(t_ind = t_ind, dist_mat = dist_mat, subset_weight = subset_weight, 
mom = mom, fine = fine, exact = exact, solver = solver)              
              
# Indices of the treated units and matched controls
t_id = out$t_id  
c_id = out$c_id	

# Time
out$time/60

# Matched group identifier (who is matched to whom)
out$group_id

# Assess mean balance
meantab(mom_covs, t_ind, t_id, c_id)

# Assess fine balance (note here we are getting an approximate solution)
for (i in 1:ncol(fine_covs)) {		
	print(finetab(fine_covs[, i], t_id, c_id))
}

# Assess exact matching balance
table(exact_covs[t_id]==exact_covs[c_id])

## Uncomment the following examples

################################## 
## Example 2: minimum distance matching
################################## 

## The goal here is to minimize the total of distances between matched pairs.  In 
## this example there are no covariate balance requirements.  Again, the solver 
## used is glpk with the approximate option

## Treatment indicator
#t_ind = treatment

## Matrix of covariates
#X_mat = cbind(age, education, black, hispanic, married, nodegree, re74, re75)

## Distance matrix
#dist_mat = distmat(t_ind, X_mat)

## Subset matching weight
#subset_weight = NULL

## Total pairs to be matched
#total_groups = sum(t_ind)

## Solver options
#t_max = 60*5
#solver = "glpk"
#approximate = 1
#solver = list(name = solver, t_max = t_max, approximate = approximate, 
#round_cplex = 0, trace_cplex = 0)

## Match                   
#out = bmatch(t_ind = t_ind, dist_mat = dist_mat, total_groups = total_groups, 
#solver = solver)              
              
## Indices of the treated units and matched controls
#t_id = out$t_id  
#c_id = out$c_id	

## Total of distances between matched pairs
#out$obj_total

## Assess mean balance
#meantab(X_mat, t_ind, t_id, c_id)

################################## 
## Example 3: optimal subset matching
################################## 

## Optimal subset matching pursues two competing goals at 
## the same time: to minimize the total sum of covariate distances  
## while matching as many observations as possible.  The trade-off 
## between these two goals is regulated by the parameter subset_weight 
## (see Rosenbaum 2012 and Zubizarreta et al. 2013 for a discussion).
## Here the balance requirements are mean balance, near-fine balance 
## and near-exact matching for different covariates.
## Again, the solver used is glpk with the approximate option.

## Treatment indicator
#t_ind = treatment

## Matrix of covariates
#X_mat = cbind(age, education, black, hispanic, married, nodegree, re74, re75)

## Distance matrix
#dist_mat = distmat(t_ind, X_mat)

## Subset matching weight
#subset_weight = median(dist_mat)

## Moment balance: constrain differences in means to be at most .05 standard deviations apart
#mom_covs = cbind(age, education, black, hispanic, married, nodegree, re74, re75)
#mom_tols = round(absstddif(mom_covs, t_ind, .05), 2)
#mom = list(covs = mom_covs, tols = mom_tols)

## Near-fine balance
#near_fine_covs = cbind(married, nodegree)
#near_fine_devs = rep(5, 2)
#near_fine = list(covs = near_fine_covs, devs = near_fine_devs)

## Near-exact matching
#near_exact_covs = cbind(black, hispanic)
#near_exact_devs = rep(5, 2)
#near_exact = list(covs = near_exact_covs, devs = near_exact_devs)

## Solver options
#t_max = 60*5
#solver = "glpk"
#approximate = 1
#solver = list(name = solver, t_max = t_max, approximate = approximate, 
#round_cplex = 0, trace_cplex = 0)

## Match                   
#out = bmatch(t_ind = t_ind, dist_mat = dist_mat, subset_weight = subset_weight, 
#mom = mom, near_fine = near_fine, near_exact = near_exact, solver = solver)              
              
## Indices of the treated units and matched controls
#t_id = out$t_id  
#c_id = out$c_id	

## Time
#out$time/60

## Matched group identifier (who is matched to whom)
#out$group_id

## Assess mean balance (note here we are getting an approximate solution)
#meantab(X_mat, t_ind, t_id, c_id)

## Assess fine balance
#for (i in 1:ncol(near_fine_covs)) {		
#	print(finetab(near_fine_covs[, i], t_id, c_id))
#}

## Assess exact matching balance
#for (i in 1:ncol(near_exact_covs)) {	
#	print(table(near_exact_covs[t_id, i]==near_exact_covs[c_id, i]))
#}
	



