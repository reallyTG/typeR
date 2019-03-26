library(climwin)


### Name: merge_results
### Title: Merge two slidingwin analyses.
### Aliases: merge_results

### ** Examples

## Not run: 
##D  
##D data(Offspring) 
##D data(OffspringClimate)
##D 
##D # Test a linear functions
##D 
##D OffspringWin_lin <- slidingwin(xvar = list(Temp = OffspringClimate$Temperature), 
##D                               cdate = OffspringClimate$Date, 
##D                               bdate = Offspring$Date, 
##D                               baseline = glm(Offspring ~ 1, data = Offspring, family = poisson),
##D                               range = c(150, 0), 
##D                               type = "relative", stat = "mean", 
##D                               func = c("lin"), cmissing = FALSE, cinterval = "day")
##D 
##D # Test a quadratic functions
##D 
##D OffspringWin_quad <- slidingwin(xvar = list(Temp = OffspringClimate$Temperature), 
##D                                cdate = OffspringClimate$Date, 
##D                                bdate = Offspring$Date, 
##D                                baseline = glm(Offspring ~ 1, data = Offspring, family = poisson),
##D                                range = c(150, 0), 
##D                                type = "relative", stat = "mean", 
##D                                func = c("quad"), cmissing = FALSE, cinterval = "day")
##D                                
##D # Combine these outputs
##D 
##D OffspringWin_comb <- merge_results(dataset1 = OffspringWin_lin, dataset2 = OffspringWin_quad)
##D 
##D #View analyses contained in the new output
##D 
##D OffspringWin_comb$combos
##D 
##D #View output from linear analysis
##D 
##D head(OffspringWin_comb[[1]]$Dataset)
##D 
## End(Not run)
       



