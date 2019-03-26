library(HDDesign)


### Name: HDDesign-package
### Title: Sample Size Calculation for High Dimensional Classification
###   Study
### Aliases: HDDesign-package HDDesign
### Keywords: package

### ** Examples

# Consider the following design scenario:
# Prevalence of Group 1
p1=0.5
# Effect size
mu0=0.4
# Total number of features
p=500
# The number of important features
m=10


# Step 1: Feasibility of the classification for a study with about 100 individuals
which.region(mu0=mu0, p=p, m=m, n=100)
# return 4, indicating the classification belongs to the feasible region. 

# Step 2: Upper bound of the PCC
ideal_pcc(mu0=mu0, m=m, p1=p1)
# return 0.8970484, 
# So the target PCC can be chosen between 0.5 and 0.8970484.

# Step 3: Obtain the sample requirement for target PCC equal to 0.8
#Use method proposed by Dobbin and Simon (2007)
set.seed(1)
samplesize(target=0.8, nmin=20, nmax=100, ds_method, mu0=0.4, p=500, m=10)
#return sample size n=66

#Use cross validation(commented due to long waiting time)
#set.seed(1)
#samplesize(target=0.8, nmin=20, nmax=100, cv_method, mu0=0.4, p=500, m=10, 
#alpha_list=10^((-10):(-2)), nrep=100) 
#alpha_list should be a dense list of p-value cutoffs; 
#here we only use a few values to ease computation of the example.
#return sample size n=78.

#Use HCT 
set.seed(1)
samplesize(target=0.8, nmin=20, nmax=100, hct_method, mu0=0.4, p=500, m=10, 
hct=hct_beta, alpha0=0.5, nrep=100) 
#return sample size n=78.




