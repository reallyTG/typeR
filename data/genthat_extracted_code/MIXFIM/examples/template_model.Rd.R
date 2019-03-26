library(MIXFIM)


### Name: template_model
### Title: Creation of a Pre-Filled Template for STAN Model.
### Aliases: template_model

### ** Examples

# UNCOMMENT EXAMPLES
#test2 = template_model(dloglik=TRUE, nb_t=13, outcome="binary", 
#nb_params=3, ind_RE=c(3), n_rep=1, name="test2")

#test3 = template_model(dloglik=TRUE, nb_t=8, outcome="continuous", 
#nb_params=13, ind_RE=c(5,6,7,8), Cov_list =
#list(c(1,2,0.06),c(2,1,0.06),c(1,3,0.04)), Sigma_fun_b=FALSE, name="test3")

#test4 = template_model( dloglik=FALSE, nb_t=4, outcome="count", 
#nb_params=4, ind_RE=c(3,4), n_rep=30, name="test4")

#test5 = template_model(dloglik=FALSE, nb_t=0, 
#outcome="time_to_event", nb_params=2, ind_RE=c(2), n_rep=10, name="test5")

#test6 = template_model(dloglik=FALSE, nb_t=4, outcome="continuous", 
#nb_params=4, ind_RE=c(3), Sigma_fun_b=FALSE, name="test6")

#test = template_model(dloglik=FALSE, nb_t=7, outcome="continuous", 
#nb_params=7, ind_RE=c(4,5,6), Sigma_fun_b=TRUE, n_rep=1, name="test_pk")



