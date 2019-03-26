library(surveysd)


### Name: draw.bootstrap
### Title: Draw bootstrap replicates
### Aliases: draw.bootstrap

### ** Examples

## Not run: 
##D eusilc <- demo.eusilc(prettyNames = TRUE)
##D 
##D ## draw sample without stratification or clustering
##D dat_boot <- draw.bootstrap(eusilc, REP = 10, weights = "pWeight", period = "year")
##D 
##D ## use stratification w.r.t. region and clustering w.r.t. households
##D dat_boot <- draw.bootstrap(eusilc, REP = 10, hid = "hid", weights = "pWeight",
##D                            strata = "region", period = "year")
##D 
##D ## use multi-level clustering
##D dat_boot <- draw.bootstrap(eusilc, REP = 10, hid = "hid", weights = "pWeight",
##D                            strata = c("region", "age"), period = "year")
##D 
##D 
##D # create spit households
##D eusilc[, pidsplit := pid]
##D year <- eusilc[, unique(year)]
##D year <- year[-1]
##D leaf_out <- c()
##D for(y in year){
##D   split.person <- eusilc[year == (y-1) & !duplicated(hid) & !(hid %in% leaf_out),
##D                          sample(pid, 20)]
##D   overwrite.person <- eusilc[(year == (y)) & !duplicated(hid) & !(hid %in% leaf_out),
##D                              .(pid = sample(pid, 20))]
##D   overwrite.person[, c("pidsplit", "year_curr") := .(split.person, y)]
##D 
##D   eusilc[overwrite.person, pidsplit := i.pidsplit, on = .(pid, year >= year_curr)]
##D   leaf_out <- c(leaf_out,
##D                 eusilc[pid %in% c(overwrite.person$pid, overwrite.person$pidsplit),
##D                 unique(hid)])
##D }
##D 
##D dat_boot <- draw.bootstrap(eusilc, REP = 10, hid = "hid", weights = "pWeight",
##D                            strata = c("region", "age"), period = "year", split = TRUE,
##D                            pid = "pidsplit")
##D # split households were considered e.g. household and
##D # split household were both selected or not selected
##D dat_boot[, data.table::uniqueN(w1), by = pidsplit][V1 > 1]
## End(Not run)




