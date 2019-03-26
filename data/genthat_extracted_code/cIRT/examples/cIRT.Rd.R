library(cIRT)


### Name: cIRT
### Title: Generic Implementation of Choice IRT MCMC
### Aliases: cIRT

### ** Examples

## Not run: 
##D # Variables
##D # Y = trial matix
##D # C = KN vector of binary choices
##D # N = #of subjects
##D # J = # of items
##D # K= # of choices
##D # atrue = true item discriminations
##D # btrue = true item locations
##D # thetatrue = true thetas/latent performance
##D # gamma = fixed effects coefficients
##D # Sig = random-effects variance-covariance
##D # subid = id variable for subjects
##D 
##D # Load the Package
##D library(cIRT)
##D 
##D # Load the Data
##D data(trial_matrix)
##D data(choice_matrix)
##D 
##D # Thurstone design matrices
##D all_nopractice = subset(all_data_trials,experiment_loop.thisN>-1)
##D hard_items = choice_matrix$hard_q_id
##D easy_items = choice_matrix$easy_q_id
##D 
##D D_easy = model.matrix(~-1+factor(easy_items))
##D D_hard = -1*model.matrix(~-1+factor(hard_items))[,-c(5,10,15)]
##D     
##D # Defining effect-coded contrasts
##D high_contrasts <- rbind(-1,diag(4))
##D rownames(high_contrasts) = 12:16
##D low_contrasts <- rbind(-1,diag(2))
##D rownames(low_contrasts) = 4:6
##D     
##D # Creating high & low factors
##D high = factor(choice_matrix[,'high_value'])
##D low = factor(choice_matrix[,'low_value'])
##D contrasts(high) = high_contrasts
##D contrasts(low) = low_contrasts
##D 
##D fixed_effects = model.matrix(~high+low)
##D fixed_effects_base = fixed_effects[,1]
##D fixed_effects_int = model.matrix(~high*low)
##D       
##D       
##D # Model with Thurstone D Matrix
##D system.time({ 
##D   out_model_thurstone = cIRT(choice_matrix[,'subject_id'], 
##D                              cbind(fixed_effects[,-1],D_easy,D_hard),
##D                              c(1:ncol(fixed_effects)), 
##D                              as.matrix(fixed_effects),
##D                              as.matrix(trial_matrix), 
##D                              choice_matrix[,'choose_hard_q'],
##D                                           20000,
##D                                           25000)
##D })
##D       
##D       
##D vlabels_thurstone = colnames(cbind(fixed_effects[,-1],D_easy,D_hard))
##D G_thurstone = t(apply(out_model_thurstone$gs0, 2, FUN = quantile,probs=c(.5,.025,.975)))
##D rownames(G_thurstone)=vlabels_thurstone
##D B_thurstone = t(apply(out_model_thurstone$beta, 2, FUN = quantile,probs=c(.5,0.025,.975)))
##D rownames(B_thurstone)=colnames(fixed_effects)
##D S_thurstone = solve(apply(out_model_thurstone$Sigma_zeta_inv, c(1,2), FUN = mean))
##D inv_sd = diag(1/sqrt(diag(solve(apply(out_model_thurstone$Sigma_zeta_inv, c(1,2), FUN = mean)))))
##D inv_sd%*%S_thurstone%*%inv_sd
##D apply(out_model_thurstone$as, 2, FUN = mean)
##D apply(out_model_thurstone$bs, 2, FUN = mean)
## End(Not run)



