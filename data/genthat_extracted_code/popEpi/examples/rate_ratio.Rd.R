library(popEpi)


### Name: rate_ratio
### Title: Confidence intervals for the rate ratios
### Aliases: rate_ratio

### ** Examples

## Not run: 
##D # two rate ratios; silly example with female rectal / breast cancer 
##D ## mortality rates
##D data("sire", package = "popEpi")
##D data("sibr", package = "popEpi")
##D 
##D BL <- list(per = 2000:2005)
##D 
##D re <- lexpand(sire, birth = "bi_date", entry = "dg_date", exit = "ex_date",
##D               status = status == 1, breaks = BL, aggre = list(per))
##D br <- lexpand(sibr, birth = "bi_date", entry = "dg_date", exit = "ex_date",
##D               status = status == 1, breaks = BL, aggre = list(per))
##D 
##D r_re <- rate(re, obs = "from0to1", pyrs = "pyrs")
##D r_br <- rate(br, obs = "from0to1", pyrs = "pyrs")
##D 
##D rate_ratio(r_re, r_br, SE.method = TRUE)
## End(Not run)

# manually set rates (0.003 and 0.005) and SEs (0.001 and 0.002)
# so that x = y = c('rate', 'SE')
rate_ratio(x= c(0.003, 0.001), y= c(0.005, 0.002), SE.method = TRUE) 

# observed numbers (10 and 20) and person-years (30000 and 40000):
rate_ratio(x = c(10, 30000), y = c(20, 40000), SE.method = FALSE)




