library(designmatch)


### Name: distmatch
### Title: Optimal distance matching in observational studies
### Aliases: distmatch
### Keywords: Causal inference Instrumental variable Matching Regression
###   discontinuity Observational study

### ** Examples

	
# Load, sort, and attach data
data(lalonde)
lalonde = lalonde[order(lalonde$treatment, decreasing = TRUE), ]
attach(lalonde)

################################# 
# Step 1: use cardinality matching to find the largest sample of matched pairs for which 
# all the covariates are finely balanced.
#################################

# Discretize covariates
quantiles = function(covar, n_q) {
	p_q = seq(0, 1, 1/n_q)
	val_q = quantile(covar, probs = p_q, na.rm = TRUE)
	covar_out = rep(NA, length(covar))
	for (i in 1:n_q) {
		if (i==1) {covar_out[covar<val_q[i+1]] = i}
		if (i>1 & i<n_q) {covar_out[covar>=val_q[i] & covar<val_q[i+1]] = i}
		if (i==n_q) {covar_out[covar>=val_q[i] & covar<=val_q[i+1]] = i}}
	covar_out
}
age_5 = quantiles(age, 5)
education_5 = quantiles(education, 5)
re74_5 = quantiles(re74, 5)
re75_5 = quantiles(re75, 5)

# Treatment indicator; note that the data needs to be sorted in decreasing order
# according to this treatment indicator
t_ind = treatment
t_ind 

# Fine balance
fine_covs = cbind(black, hispanic, married, nodegree, age_5, education_5, re74_5, re75_5)
fine = list(covs = fine_covs)

# Solver options
t_max = 60*5
solver = "glpk"
approximate = 0
solver = list(name = solver, t_max = t_max, approximate = approximate,
round_cplex = 0, trace = 0)

# Match                   
out_1 = cardmatch(t_ind, fine = fine, solver = solver)

# Indices of the treated units and matched controls
t_id_1 = out_1$t_id  
c_id_1 = out_1$c_id	

# Mean balance
covs = cbind(age, education, black, hispanic, married, nodegree, re74, re75)
meantab(covs, t_ind, t_id_1, c_id_1)

# Fine balance (note here we are getting an approximate solution)
for (i in 1:ncol(fine_covs)) {		
	print(finetab(fine_covs[, i], t_id_1, c_id_1))
}

################################# 
# Step 2: use optimal matching (minimum distance matching) to find the (re)pairing of
# treated and control that minimizes the total sum of covariate distances between matched 
# pairs.  For this, use the function 'distmatch' which is a wrapper for 'bmatch'.  
#################################

# New treatment indicator
t_ind_2 = t_ind[c(t_id_1, c_id_1)]
table(t_ind_2)

# To build the distance matrix, the idea is to use strong predictors of the outcome
dist_mat_2 = abs(outer(re74[t_id_1], re74[c_id_1], "-"))
dim(dist_mat_2)

# Match
out_2 = distmatch(t_ind_2, dist_mat_2, solver)

# Indices of the treated units and matched controls
t_id_2 = t_id_1[out_2$t_id]  
c_id_2 = c_id_1[out_2$c_id-length(out_2$c_id)]	

# Covariate balance is preserved...
meantab(covs, t_ind, t_id_2, c_id_2)
for (i in 1:ncol(fine_covs)) {		
	print(finetab(fine_covs[, i], t_id_2, c_id_2))
}

# ... but covariate distances are reduced
distances_step_1 = sum(diag(dist_mat_2)) 
distances_step_2 = sum(diag(dist_mat_2[out_2$t_id, out_2$c_id-length(out_2$c_id)])) 
distances_step_1
distances_step_2

# The mean difference in outcomes is the same...
mean(re78[t_id_1]-re78[c_id_1])
mean(re78[t_id_2]-re78[c_id_2])

# ... but their standard deviation is reduced
sd(re78[t_id_1]-re78[c_id_1])
sd(re78[t_id_2]-re78[c_id_2])
	



