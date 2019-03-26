library(BayClone2)


### Name: BayClone2
### Title: BayClone2 function
### Aliases: BayClone2
### Keywords: Posterior-sampling

### ** Examples

##ILLUSTRATE BayClone2 WITH A SMALL SIMULATION.
###REPRODUCE SIMULATION 1 OF LEE ET AL.
library("BayClone2")

##READ IN DATA
data(BayClone2_Simulation1_mut)
data(BayClone2_Simulation1_tot)
##TOTAL NUMBER OF READS AT LOCUS s IN SAMPLE t
N <- as.matrix(BayClone2_Simulation1_tot)  
##NUMBER OF READS WITH VARIANT SEQUENCE AT LOCUS s IN SAMPLE t
n <- as.matrix(BayClone2_Simulation1_mut) 

S <- nrow(N)  # THE NUMBER OF LOCI (I.E. NUMBER OF ROWS OF N (AND n))
T <- ncol(N) #THE NUMBER OF TISSUE SAMPLES  (I.E. NUMBER OF COLUMNS OF N (AND n))

###################################
#HYPER-PARAMETER  ----SPECIFYING HYPERPARAMETER VALUES
######################################
#HYPER-PARAMETER
hyper <- NULL

#NUMBER OF SUBCLONES (GEOMETRIC DIST)
### C ~ GEOMETRIC(r) WHERE E(C)=1/r
hyper$r <- 0.2

#PRIOR FOR L
hyper$Q <- 3  #NUMBER OF COPIES -- q = 0, 1, 2, 3

##BETA-DIRICHLET
###PI_C | C ~ BETA-DIRICHLET (ALPHA/C, BETA, GAMMA)
hyper$alpha <- 2
hyper$beta <- 1
hyper$gam <- c(0.5, 0.5, 0.5)

#PRIOR FOR PHI--TOTAL NUMBER OF READS IN SAMPLE T
###PHI_T ~ GAMMA(A, B)
hyper$b <- 3
hyper$a <- median(N)*hyper$b

#PRIOR FOR P_O
###P0 ~ BETA(a, b)
hyper$a_z0 <- 0.3
hyper$b_z0 <- 5

#PRIOR FOR W
##W_T | L ~ DIRICHLET(D0, D, ..., D) WHERE W_T=(w_t0, w_t1, ..., w_tC)
hyper$d0 <- 0.5
hyper$d <- 1

#WE USE THE MCMC SIMULATION STRATEGY PROPOSED IN LEE AT EL (2014)
n.sam <- 10000;  ##NUMBER OF SAMPLES THAT WILL BE USED FOR INFERENCE
##NUMBER OF SAMPLES FOR BURN-IN 
#(USE THIS FOR A TRAINING DATA---FOR DETIALS, SEE THE REFERENCE)
burn.in <- 6000  

##############################################
###WE CONSIDER C BETWEEN 1 AND 15 IN ADDITION TO BACKGROUND SUBCLONE
####Max_C AND Min_C SPECIFIES VALUES OF C FOR POSTERIOR EXPLORATION
Min_C <- 2  ##INCLUDING THE BACKGROUND SUBCLONE
Max_C <- 16  ##INCLUDING THE BACKGROUND SUBCLONE


#################################################################
##DO MCMC SAMPLING FROM BAYCLONE2!
#################################################################
##THE LAST ARGUMENT (0.025) IS THE MEAN PROPORTION FOR THE TRAINING DATASET (SPECIFIED BY USERS)
##IT WILL BE USED TO SPLIT INTO TRAINING AND TEST DATASETS
##FOR DETAILS, SEE THE REFERENCE LEE AT EL (2014)
##TO RUN, COMMENT IN THE LINE BELOW (WARNING! THIS MAY TAKE APPROXIMATELY 30 MINUTES)
#set.seed(11615)
#MCMC.sam <- BayClone2(Min_C, Max_C, S, T, burn.in, n.sam, N, n, hyper, 0.025)


#################################################################
#COMPUTE THE POSTERIOR MARGINAL DIST OF C (THE NUMBER OF SUBCLONES)
#################################################################
##TO RUN, COMMENT IN THE LINE BELOW
#post_dist_C <- fn_post_C(MCMC.sam$C, Min_C, Max_C)

######################################################################################
####WE FIND POSTERIOR POINT ESTIMATES OF L, Z, W, PHI, PI, P0 FOR A CHOSEN VALUE OF C
######################################################################################
##THE FIRST ARGUMENT (3) IS A VALUE OF C CHOSEN BY USERS
#C IS THE NUMBER OF SUBCLONES INCLUDING THE BACKGROUND SUBCLONE
##THE CHOSE VALUE OF C SHOULD BE LESS THAN OR EQUAL TO 10 (INCLUDING THE BACKGROUND SUBCLONE)
#DUE TO THE PERMUTATION (FOR DETAILS, SEE SEE THE REFERENCE LEE AT EL (2014))
##TO RUN, COMMENT IN THE LINE BELOW (WARNING! THIS MAY TAKE ARPPOXIMATELY 15 MINUTES)
#point.est <- fn_posterior_point(3, S, T, MCMC.sam)





