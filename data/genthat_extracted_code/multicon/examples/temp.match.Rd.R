library(multicon)


### Name: temp.match
### Title: Template Matching
### Aliases: temp.match
### Keywords: Template Matching

### ** Examples

data(caq)
data(opt.temp)
	# Template Matching
    # Sometimes we want to know how closely each Profile matches a theoretically
    # or empirically derived Profile (i.e., a template).
    # Here is the template for the optimally adjusted person in the CAQ.
opt.temp 
temp.match(opt.temp, caq)  # The overall template match scores
temp.match(opt.temp, caq, distinct=TRUE) # Both overall and distinctive template match scores
    # The replicability (reliablity) of the template match scores can also be estimated
temp.match.rep(opt.temp,caq)



