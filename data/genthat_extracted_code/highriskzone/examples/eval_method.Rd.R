library(highriskzone)


### Name: eval_method
### Title: Evaluation of the procedures determining the high-risk zone.
### Aliases: eval_method

### ** Examples

## Not run: 
##D     
##D  data(craterB)
##D  
##D  # the input values are mainly the same as in det_hrz, so for more example ideas, 
##D  # see the documentation of det_hrz.
##D  evalm <- eval_method(craterB, type = c("dist", "intens"), criterion = c("area", "area"), 
##D                       cutoff = c(1500000, 1500000), nxprob = 0.1, numit = 10, 
##D                       simulate = "clintens", radiusClust = 300, 
##D                       clustering = 15, pbar = FALSE)
##D  evalm_d <- subset(evalm, evalm$Type == "dist")
##D  evalm_i <- subset(evalm, evalm$Type == "intens")
##D  
##D  # pout:  fraction of high-risk zones that leave at least one unobserved event uncovered
##D  # pmiss:  Mean fraction of unobserved events outside the high-risk zone
##D  data.frame(pmiss_d = mean(evalm_d$missingfrac),
##D             pmiss_i = mean(evalm_i$missingfrac),
##D             pout_d = ( sum(evalm_d$numbermiss > 0) / nrow(evalm_d) ), 
##D             pout_i = ( sum(evalm_i$numbermiss > 0) / nrow(evalm_i) ))
## End(Not run)



