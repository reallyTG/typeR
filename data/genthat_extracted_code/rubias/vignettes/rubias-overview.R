## ---- echo = FALSE, message=FALSE----------------------------------------
knitr::opts_chunk$set(
  fig.width = 7,
  fig.height = 5
)

## ----head-chinook--------------------------------------------------------
library(rubias)
library(tidyverse)
head(chinook[, 1:8])

## ----head-chinook-mix----------------------------------------------------
head(chinook_mix[, 1:8])

## ----infer_mixture1------------------------------------------------------
mix_est <- infer_mixture(reference = chinook, 
                         mixture = chinook_mix, 
                         gen_start_col = 5)

## ----look-at-mix-est-----------------------------------------------------
lapply(mix_est, head)

## ----aggregating---------------------------------------------------------
# for mixing proportions
rep_mix_ests <- mix_est$mixing_proportions %>%
  group_by(mixture_collection, repunit) %>%
  summarise(repprop = sum(pi))  # adding mixing proportions over collections in the repunit

# for individuals posteriors
rep_indiv_ests <- mix_est$indiv_posteriors %>%
  group_by(mixture_collection, indiv, repunit) %>%
  summarise(rep_pofz = sum(PofZ))

## ----plot-6--------------------------------------------------------------
# find the top 6 most abundant:
top6 <- rep_mix_ests %>%
  filter(mixture_collection == "rec1") %>% 
  arrange(desc(repprop)) %>%
  slice(1:6)

# check how many MCMC sweeps were done:
nsweeps <- max(mix_est$mix_prop_traces$sweep)

# keep only rec1, then discard the first 200 sweeps as burn-in,
# and then aggregate over reporting units
# and then keep only the top6 from above
trace_subset <- mix_est$mix_prop_traces %>%
  filter(mixture_collection == "rec1", sweep > 200) %>%
  group_by(sweep, repunit) %>%
  summarise(repprop = sum(pi)) %>% 
  filter(repunit %in% top6$repunit)


# now we can plot those:
ggplot(trace_subset, aes(x = repprop, colour = repunit)) +
  geom_density()

## ------------------------------------------------------------------------
top6_cis <- trace_subset %>%
  group_by(repunit) %>%
  summarise(loCI = quantile(repprop, probs = 0.025),
            hiCI = quantile(repprop, probs = 0.975))

top6_cis

## ----plot-zs-------------------------------------------------------------
# get the maximum-a-posteriori population for each individual
map_rows <- mix_est$indiv_posteriors %>%
  group_by(indiv) %>%
  top_n(1, PofZ) %>%
  ungroup()

## ----z-score-density-----------------------------------------------------
normo <- tibble(z_score = rnorm(1e06))
ggplot(map_rows, aes(x = z_score)) +
  geom_density(colour = "blue") +
  geom_density(data = normo, colour = "black")

## ----self-ass------------------------------------------------------------
sa_chinook <- self_assign(reference = chinook, gen_start_col = 5)

## ----self-ass-results----------------------------------------------------
head(sa_chinook, n = 100)

## ----summ2repu-----------------------------------------------------------
sa_to_repu <- sa_chinook %>%
  group_by(indiv, collection, repunit, inferred_repunit) %>%
  summarise(repu_scaled_like = sum(scaled_likelihood))

head(sa_to_repu, n = 200)

## ----chin-sims, message=FALSE--------------------------------------------
chin_sims <- assess_reference_loo(reference = chinook, 
                     gen_start_col = 5, 
                     reps = 50, 
                     mixsize = 200)

## ----show-chin-sims------------------------------------------------------
chin_sims

## ----top6list------------------------------------------------------------
top6

## ----roundem-------------------------------------------------------------
round(top6$repprop * 350)

## ----make-arep-----------------------------------------------------------
arep <- top6 %>%
  ungroup() %>%
  mutate(dirichlet = 10 * repprop) %>%
  select(repunit, dirichlet)

arep

## ----chin-sim-top6, message=FALSE----------------------------------------
chin_sims_repu_top6 <- assess_reference_loo(reference = chinook, 
                     gen_start_col = 5, 
                     reps = 50, 
                     mixsize = 200,
                     alpha_repunit = arep)

## ----summ-top6-----------------------------------------------------------
# now, call those repunits that we did not specify in arep "OTHER"
# and then sum up over reporting units
tmp <- chin_sims_repu_top6 %>%
  mutate(repunit = ifelse(repunit %in% arep$repunit, repunit, "OTHER")) %>%
  group_by(iter, repunit) %>%
  summarise(true_repprop = sum(true_pi), 
            reprop_posterior_mean = sum(post_mean_pi),
            repu_n = sum(n)) %>%
  mutate(repu_n_prop = repu_n / sum(repu_n))
  

## ----plot-top6-----------------------------------------------------------
# then plot them
ggplot(tmp, aes(x = true_repprop, y = reprop_posterior_mean, colour = repunit)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  facet_wrap(~ repunit)

## ----plot-top6-n---------------------------------------------------------
ggplot(tmp, aes(x = repu_n_prop, y = reprop_posterior_mean, colour = repunit)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  facet_wrap(~ repunit)

## ----chin-sim-top6-indiv, message=FALSE----------------------------------
set.seed(100)
chin_sims_with_indivs <- assess_reference_loo(reference = chinook, 
                     gen_start_col = 5, 
                     reps = 50, 
                     mixsize = 200,
                     alpha_repunit = arep,
                     return_indiv_posteriors = TRUE)

# print out the indiv posteriors
chin_sims_with_indivs$indiv_posteriors

## ----boxplot-pofz-indiv-sim----------------------------------------------
# summarise things
repu_pofzs <- chin_sims_with_indivs$indiv_posteriors %>%
  filter(repunit == simulated_repunit) %>%
  group_by(iter, indiv, simulated_collection, repunit) %>%  # first aggregate over reporting units
  summarise(repu_PofZ = sum(PofZ)) %>%
  ungroup() %>%
  arrange(repunit, simulated_collection) %>%
  mutate(simulated_collection = factor(simulated_collection, levels = unique(simulated_collection)))

# also get the number of simulated individuals from each collection
num_simmed <- chin_sims_with_indivs$indiv_posteriors %>%
  group_by(iter, indiv) %>%
  slice(1) %>%
  ungroup() %>%
  count(simulated_collection)
  
# note, the last few steps make simulated collection a factor so that collections within
# the same repunit are grouped together in the plot.

# now, plot it
ggplot(repu_pofzs, aes(x = simulated_collection, y = repu_PofZ)) +
  geom_boxplot(aes(colour = repunit)) +
  geom_text(data = num_simmed, mapping = aes(y = 1.025, label = n), angle = 90, hjust = 0, vjust = 0.5, size = 3) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 9, vjust = 0.5)) +
  ylim(c(NA, 1.05))

## ---- message=FALSE------------------------------------------------------
set.seed(101) # for reproducibility
# do the simulation
chin_sims_by_gc <- assess_reference_loo(reference = chinook, 
                     gen_start_col = 5, 
                     reps = 50, 
                     mixsize = 200,
                     alpha_repunit = arep,
                     return_indiv_posteriors = TRUE,
                     resampling_unit = "gene_copies")


## ----boxplot-pofz-gc-sim-------------------------------------------------
# summarise things
repu_pofzs_gc <- chin_sims_by_gc$indiv_posteriors %>%
  filter(repunit == simulated_repunit) %>%
  group_by(iter, indiv, simulated_collection, repunit) %>%  # first aggregate over reporting units
  summarise(repu_PofZ = sum(PofZ)) %>%
  ungroup() %>%
  arrange(repunit, simulated_collection) %>%
  mutate(simulated_collection = factor(simulated_collection, levels = unique(simulated_collection)))

# also get the number of simulated individuals from each collection
num_simmed_gc <- chin_sims_by_gc$indiv_posteriors %>%
  group_by(iter, indiv) %>%
  slice(1) %>%
  ungroup() %>%
  count(simulated_collection)
  
# note, the last few steps make simulated collection a factor so that collections within
# the same repunit are grouped together in the plot.

# now, plot it
ggplot(repu_pofzs_gc, aes(x = simulated_collection, y = repu_PofZ)) +
  geom_boxplot(aes(colour = repunit)) +
  geom_text(data = num_simmed_gc, mapping = aes(y = 1.025, label = n), angle = 90, hjust = 0, vjust = 0.5, size = 3) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 9, vjust = 0.5)) +
  ylim(c(NA, 1.05))

## ------------------------------------------------------------------------
arep

## ------------------------------------------------------------------------
arep_subs <- tribble(
  ~collection, ~sub_ppn,
  "Eel_R",   0.1,
  "Russian_R", 0.9,
  "Butte_Cr_fa", 0.7,
  "Feather_H_sp", 0.3
)

## ---- message=FALSE------------------------------------------------------
chin_sims_sub_ppn <- assess_reference_loo(reference = chinook, 
                     gen_start_col = 5, 
                     reps = 50, 
                     mixsize = 200,
                     alpha_repunit = arep,
                     alpha_collection = arep_subs,
                     return_indiv_posteriors = FALSE)  # don't bother returning individual posteriors

## ------------------------------------------------------------------------
chin_sims_sub_ppn %>%
  group_by(repunit, collection) %>%
  summarise(mean_pi = mean(true_pi)) %>%
  group_by(repunit) %>%
  mutate(repunit_mean_pi = sum(mean_pi),
         fract_within = mean_pi / repunit_mean_pi) %>%
  mutate(fract_within = ifelse(fract_within < 1e-06, 0, fract_within))  %>% # anything less than 1 in a million gets called 0
  filter(repunit_mean_pi > 0.0)

## ------------------------------------------------------------------------
arep$repunit

## ----six-hundy1----------------------------------------------------------
six_hundy_scenarios <- lapply(arep$repunit, function(x) tibble(repunit = x, ppn = 1.0))
names(six_hundy_scenarios) <- paste("All", arep$repunit, sep = "-")

## ----six-hundy2, message=FALSE-------------------------------------------
repu_hundy_results <- assess_reference_loo(reference = chinook, 
                     gen_start_col = 5, 
                     reps = 5, 
                     mixsize = 50,
                     alpha_repunit = six_hundy_scenarios,
                     alpha_collection = 10)
repu_hundy_results

## ----hundy-colls1--------------------------------------------------------
set.seed(10)
hundy_colls <- sample(unique(chinook$collection), 5)
hundy_colls

## ----hundy-colls2--------------------------------------------------------
hundy_coll_list <- lapply(hundy_colls, function(x) tibble(collection = x, ppn = 1.0)) %>%
  setNames(paste("100%", hundy_colls, sep = "_"))

## ----hundy-colls-do, message=FALSE---------------------------------------
hundy_coll_results <- assess_reference_loo(reference = chinook, 
                     gen_start_col = 5, 
                     reps = 6, 
                     mixsize = 50,
                     alpha_collection = hundy_coll_list)
hundy_coll_results

## ----infer_mixture_pb, eval=FALSE----------------------------------------
#  mix_est_pb <- infer_mixture(reference = chinook,
#                           mixture = chinook_mix,
#                           gen_start_col = 5,
#                           method = "PB")

## ---- eval=FALSE---------------------------------------------------------
#  mix_est_pb$mixing_proportions %>%
#    group_by(mixture_collection, repunit) %>%
#    summarise(repprop = sum(pi)) %>%
#    left_join(mix_est_pb$bootstrapped_proportions) %>%
#    ungroup() %>%
#    filter(mixture_collection == "rec1") %>%
#    arrange(desc(repprop)) %>%
#    slice(1:10)

