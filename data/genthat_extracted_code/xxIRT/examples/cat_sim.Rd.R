library(xxIRT)


### Name: cat_sim
### Title: Simulation of Computerized Adaptive Testing (CAT)
### Aliases: cat_sim cat_sim cat_estimate_mle cat_estimate_eap
###   cat_estimate_hybrid cat_stop_default cat_select_maxinfo
###   cat_select_ccat cat_select_shadow print.cat plot.cat
###   cat_stop_projection

### ** Examples

## Not run: 
##D ## generate a 100-item pool
##D num_items <- 100
##D pool <- with(model_3pl_gendata(1, num_items), data.frame(a=a, b=b, c=c))
##D pool$set_id <- sample(1:30, num_items, replace=TRUE)
##D pool$content <- sample(1:3, num_items, replace=TRUE)
##D pool$time <- round(rlnorm(num_items, mean=4.1, sd=.2))
##D 
##D ## MLE, EAP, and hybrid estimation rule
##D cat_sim(1.0, pool, min=10, max=20, estimate_rule=cat_estimate_mle)
##D cat_sim(1.0, pool, min=10, max=20, estimate_rule=cat_estimate_eap)
##D cat_sim(1.0, pool, min=10, max=20, estimate_rule=cat_estimate_hybrid)
##D 
##D ## SE, MI, and CI stopping rule
##D cat_sim(1.0, pool, min=10, max=20, stop_se=.3)
##D cat_sim(1.0, pool, min=10, max=20, stop_mi=.6)
##D cat_sim(1.0, pool, min=10, max=20, stop_cut=0)
##D cat_sim(1.0, pool, min=10, max=20, stop_cut=0, ci_width=2.58)
##D 
##D ## maximum information selection with item sets
##D cat_sim(1.0, pool, min=10, max=20, group="set_id")$admin
##D 
##D ## maximum information with item exposure control
##D cat_sim(1.0, pool, min=10, max=20, info_random=5)$admin
##D 
##D ## Constrained-CAT selection rule with and without initial randomness
##D cat_sim(1.0, pool, min=10, max=20, select_rule=cat_select_ccat, 
##D         ccat_var="content", ccat_perc=c("1"=.2, "2"=.3, "3"=.5))
##D cat_sim(1.0, pool, min=10, max=20, select_rule=cat_select_ccat, ccat_random=5,
##D         ccat_var="content", ccat_perc=c("1"=.2, "2"=.3, "3"=.5))
##D 
##D ## Shadow-test selection rule
##D cons <- data.frame(var='content', level=1:3, min=c(3,3,4), max=c(3,3,4))
##D cons <- rbind(cons, data.frame(var='time', level=NA, min=55*10, max=65*10))
##D cat_sim(1.0, pool, min=10, max=10, select_rule=cat_select_shadow, constraints=cons)
##D 
##D ## Projection-based stopping rule
##D cons <- data.frame(var='content', level=1:3, min=5, max=15)
##D cons <- rbind(cons, data.frame(var='time', level=NA, min=60*20, max=60*40))
##D cat_sim(1.0, pool, min=20, max=40, select_rule=cat_select_shadow, stop_rule=cat_stop_projection, 
##D         projection_method="diff", stop_cut=0, constraints=cons)
## End(Not run)



