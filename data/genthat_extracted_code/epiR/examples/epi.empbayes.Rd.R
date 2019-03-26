library(epiR)


### Name: epi.empbayes
### Title: Empirical Bayes estimates
### Aliases: epi.empbayes
### Keywords: univar univar

### ** Examples

data(epi.SClip)
obs <- epi.SClip$cases; pop <- epi.SClip$population

est <- epi.empbayes(obs, pop)
crude.p <- ((obs) / (pop)) * 100000
crude.r <- rank(crude.p)
ebay.p <- ((obs + est[4]) / (pop + est[3])) * 100000
dat <- data.frame(rank = c(crude.r, crude.r), 
   Method = c(rep("Crude", times = length(crude.r)), 
      rep("Empirical Bayes", times = length(crude.r))),
   est = c(crude.p, ebay.p)) 

## Scatter plot showing the crude and empirical Bayes adjusted lip cancer 
## incidence rates as a function of district rank for the crude lip 
## cancer incidence rates: 
                          
## Not run: 
##D library(ggplot2)
##D 
##D ggplot(dat, aes(x = rank, y = est, colour = Method)) + 
##D    geom_point() +
##D    ylab("Lip cancer incidence rates (cases per 100,000 person years)") +
##D    scale_x_continuous(name = "District rank", 
##D       breaks = seq(from = 0, to = 60, by = 10), 
##D       labels = seq(from = 0, to = 60, by = 10), 
##D       limits = c(0,60)) +
##D    ylim(0,30)
## End(Not run)



