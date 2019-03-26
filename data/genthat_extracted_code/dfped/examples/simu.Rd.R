library(dfped)


### Name: simu
### Title: A simulation of a single dose-finding trials in paediatrics.
### Aliases: simu crmAtj

### ** Examples
 
## Not run: 
##D  
##D     library(rstan)
##D     adaptivePrior <- TRUE
##D 
##D     ####### Targets  ###########
##D 
##D     targetTox <- 0.25   # target of toxicity
##D     targetEff <- 0.20   # target of efficacy 
##D 
##D     ####### Skeleton ###########
##D 
##D     skeleton_tox1 <- c(0.10, 0.21, 0.33, 0.55, 0.76) 
##D     skeleton_tox2 <- c(0.21, 0.33, 0.55, 0.76, 0.88) 
##D     skeleton_tox3 <- c(0.05, 0.10, 0.21, 0.33, 0.55) 
##D     skeleton_tox4 <- c(0.025, 0.05,0.1, 0.21, 0.33) 
##D     skeleton_tox5 <- c(0.0125, 0.025, 0.05,0.1, 0.21) 
##D 
##D     skeleton_eff <- c(0.04937516, 0.20496890, 0.43388003, 0.64409781, 0.79313693) 
##D     skeleton_tox <-  data.frame(skeleton_tox1, skeleton_tox2, skeleton_tox3,
##D                         skeleton_tox4, skeleton_tox5)
##D     skeleton_eff <-  data.frame(skeleton_eff, skeleton_eff, skeleton_eff,
##D                         skeleton_eff, skeleton_eff)  
##D 
##D     ############# Priors ############
##D     priorModel  <- list(rep(1/5,5), 0.001)
##D     sd <- 0.65  
##D     mu <- -0.34   
##D 
##D     ####### Trial settings  #############
##D 
##D     startingDose <- 1 
##D     nbSubjects <- 15   
##D     cohortSize <- 3       
##D 
##D     nbDesign <- length(skeleton_tox[1,])  
##D     nbDoses <- length(scenario_tox)       
##D 
##D     lesb <- calcul.bi(skeleton_tox[,1], mu, a = NULL, "power_log", targetTox) 
##D     sigmaLI <- sigmaLI(skeleton_tox[,1],  mu, a = NULL, "power_log", targetTox)
##D     sigmaHI <- sigmaHI(skeleton_tox[,1],  mu, a = NULL, "power_log", targetTox, 0.80)
##D 
##D     ################## Scenarios ##############
##D 
##D     scenario_tox <- c(0.1301477, 0.2774171, 0.4184642, 0.6486846, 0.8257219)  
##D     scenario_eff <- c(0.07945205, 0.20000000, 0.33686856, 0.59537737, 0.80996173)  
##D 
##D     stancode <- 'data {
##D         int <lower = 0> J; //nb of patients
##D         int <lower = 0> K; // nb of doses and dose reference
##D         real r[K]; // skeleton for tox - K doses
##D         real q[K]; // skeleton for efficacy - K doses
##D         int y[J]; // toxicity of patient j
##D         int v[J]; // efficacy of patient j
##D         int d[J]; // dose received by patient j
##D         real moy; // mean for the normal prior of toxicity
##D         real standardError; //standard error of the normal prior of toxicity
##D     }
##D     parameters {
##D         real <lower = 0> alpha;
##D         real  <lower = 0> beta;
##D     }
##D     transformed parameters{
##D         real <lower = 0, upper = 1> varphi[K]; // marginal probability of toxicity for dose k
##D         real <lower = 0, upper = 1> psi[K]; // marginal probability of efficacy for dose k
##D         // defining the marginal probabilities for each value of a and b for each dose
##D         real p01[K]; // tox = 0, eff = 1
##D         real p10[K]; // tox = 1, eff = 0
##D         real p11[K]; // tox = 1, eff = 1
##D         real p00[K]; // tox = 0, eff = 0
##D 
##D         vector[J] logLike;
##D 
##D         for (k in 1:K){
##D             varphi[k] = exp(alpha*log(r[k]));
##D             psi[k] = exp(beta*log(q[k]));
##D         }
##D         
##D         
##D         // computing the marginal probabilities for each dose
##D             for (k in 1:K){
##D                 p01[k] = (1-varphi[k])*psi[k]; 
##D                 p10[k] = varphi[k]*(1-psi[k]);
##D                 p00[k] = (1-varphi[k])*(1-psi[k]);
##D                 p11[k] = varphi[k]*psi[k];
##D             }
##D         // Computing the log-likelihood
##D             for (j in 1:J){
##D                 logLike[j] = y[j]*v[j]*log(p11[d[j]]) + y[j]*(1-v[j])*log(p10[d[j]]) 
##D                 + (1-y[j])*v[j]*log(p01[d[j]]) + (1-y[j])*(1-v[j])*log(p00[d[j]]);
##D             }
##D         
##D     }
##D     model {
##D         // priors
##D         alpha ~lognormal(moy, standardError);
##D         beta ~ lognormal(0,sqrt(1.34));              
##D         increment_log_prob(sum(logLike));
##D     }'
##D     
##D     crm_model <- stan_model(model_code = stancode) 
##D 
##D     ################## Simulation ##############
##D 
##D     simu(targetTox, targetEff, skeleton_tox, skeleton_eff,
##D         startingDose, nbSubjects, crm_model, cohortSize, scenario_tox,
##D         scenario_eff, nbDesign, mu, sd = sd, lesb,
##D         sigmaLI, sigmaHI, adaptivePrior)
## End(Not run)



