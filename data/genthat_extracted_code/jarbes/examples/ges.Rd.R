library(jarbes)


### Name: ges
### Title: Generalized Evidence Synthesis with Direct Penalization of
###   Observational Studies
### Aliases: ges

### ** Examples


## Not run: 
##D 
##D  library(jarbes)
##D  data(ppvipv)
##D  
##D  # Three levels hierarchical model ....
##D  m1.ges = ges(ppvipv)
##D  summary(m1.ges)
##D  
##D  # Three levels hierarchical mode with empirical bias penalization...
##D  m2.ges = ges(ppvipv, EmBi = TRUE)
##D  summary(m2.ges)
##D  
##D  # Three levels hierarchical model with explicit bias penalization ...
##D  m3.ges = ges(ppvipv, ExPe = TRUE, K = 0.5, df = 10)
##D  summary(m3.ges)
## End(Not run)





