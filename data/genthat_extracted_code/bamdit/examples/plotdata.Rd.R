library(bamdit)


### Name: plotdata
### Title: Basic function to plot results of meta-analysis of diagnostic
###   test data
### Aliases: plotdata

### ** Examples


## execute analysis
## Not run: 
##D 
##D data(ct)
##D gr <- with(ct, factor(design,
##D                      labels = c("Retrospective study", "Prospective study")))
##D 
##D plotdata(ct,              # Data frame
##D         group = gr,       # Groupping variable
##D         y.lo = 0.75,      # Lower limit of y-axis
##D         x.up = 0.75,      # Upper limit of x-axis
##D         alpha.p = 0.5,    # Transparency of the balls
##D         max.size = 5)     # Scale the circles
##D 
##D 
##D data(glas)
##D plotdata(glas,                 # Data frame
##D         group = glas$marker,  # Groupping variable
##D         max.size = 5)         # Scale of circles
##D 
##D 
##D data(scheidler)
##D plotdata(scheidler, group = scheidler$test)
##D 
##D 
##D data(safdar05)
##D plotdata(safdar05)
##D plotdata(safdar05, group = safdar05$technique)
##D 
##D library(dplyr)
##D safdar05 %>% plotdata(group = safdar05$duration)
##D 
##D 
##D data(ep)
##D ep.gr <- with(ep, factor(d1,
##D ep.gr <- with(ep, factor(d1, labels = c("Prospective study", "Retrospective study")))
##D 
##D 
##D ep %>% plotdata(group = ep.gr)
##D ep %>% plotdata(group = factor(ep$nthres))
##D 
##D 
## End(Not run)





