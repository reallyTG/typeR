library(cystiSim)


### Name: cystiSim
### Title: 'cystiSim' object
### Aliases: cystiSim report elim print.cystiSim summary.cystiSim
###   plot.cystiSim report.cystiSim elim.cystiSim

### ** Examples

## Not run: 
##D 
##D ## we will use the built-in Mbeya dataset
##D prevalence(pig_mbeya$cysti)
##D prevalence(man_mbeya$taenia)
##D 
##D ## define transmission probabilities
##D ph2m <- 0.000174918
##D pl2m <- 0.000149501
##D m2p  <- 6.85E-05
##D e2p  <- 0.00022611
##D 
##D ## set seed for reproducibility
##D set.seed(264)
##D 
##D ## need to define coverage and efficacy of all interventions
##D cov_man_mda <- 0.80
##D cov_pig_mda <- 0.90
##D cov_pig_vac <- NULL
##D eff_man_mda <- 0.70
##D eff_pig_mda <- 0.90
##D eff_pig_vac <- NULL
##D 
##D ## run the simulations
##D sim <-
##D cystiSim(
##D   n = 10,
##D   main = "example",
##D   mod = {
##D initiate(man_mbeya, pig_mbeya, ph2m, pl2m, m2p, e2p) %>%
##D   update(240) %>%
##D   do_man_mda(coverage = cov_man_mda, efficacy = eff_man_mda) %>%
##D   do_pig_mda(coverage = cov_pig_mda, efficacy = eff_pig_mda) %>%
##D   update(120)
##D   }
##D )
##D 
##D ## summarize results
##D summary(sim)
##D 
##D ## plot simulations (mean and uncertainty interval)
##D plot(sim)
##D 
##D ## create PDF report and plot
##D report(sim)
## End(Not run)



