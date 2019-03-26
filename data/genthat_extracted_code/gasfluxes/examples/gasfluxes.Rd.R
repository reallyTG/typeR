library(gasfluxes)


### Name: gasfluxes
### Title: Flux calculation
### Aliases: gasfluxes

### ** Examples

## Not run: 
##D #compare result of original HMR with plinear HMR
##D data(fluxMeas)
##D res <- gasfluxes(fluxMeas[1:400,], 
##D                  .id = "serie", .V = "V", .A = "A",
##D                  .times = "time", .C = "C",
##D                  methods = c("HMR", "original HMR"), verbose = TRUE)
##D                  
##D #number of successful fits
##D res[, sum(!is.na(HMR.kappa))]
##D res[, sum(!is.na(original.HMR.kappa))]
##D 
##D #Do the results differ?
##D plot(res[["HMR.f0"]], res[["original.HMR.f0"]])
##D abline(0, 1)
##D 
##D 
##D res <- gasfluxes(fluxMeas, 
##D                  .id = "serie", .V = "V", .A = "A",
##D                  .times = "time", .C = "C",
##D                  methods = "HMR", verbose = TRUE)
##D # Error: time not sorted in flux ID ID556. 
##D # Investigate the problem:
##D fluxMeas[serie %in% c("ID555", "ID556", "ID557")]
##D #    serie        V A      time         C
##D # 1: ID555 0.551625 1 0.0000000 0.3884388
##D # 2: ID555 0.551625 1 0.3333333 0.4125270
##D # 3: ID555 0.551625 1 0.6666667 0.3714207
##D # 4: ID555 0.551625 1 1.0000000 0.3735092
##D # 5: ID556 0.524250 1 0.0000000 0.3638239
##D # 6: ID556 0.524250 1 0.3333333 0.3520481
##D # 7: ID556 0.524250 1 0.6666667 0.3551644
##D # 8: ID557 0.528375 1 0.0500000 0.3954601
##D # 9: ID556 0.524250 1 0.0000000 0.3839834
##D #10: ID557 0.528375 1 0.3333333 0.3967269
##D #11: ID557 0.528375 1 0.6666667 0.3764967
##D #12: ID557 0.528375 1 1.0000000 0.3973055
##D 
##D # some mixup of IDs and times
##D # usually an input or Excel error during data preparation
##D # investigate and fix
## End(Not run) 




