library(multicon)


### Name: temp.match.rep
### Title: Template Matching Replicability
### Aliases: temp.match.rep
### Keywords: Template matching Replicability

### ** Examples

data(opt.temp)
data(caq)
	# Template Matching
	# Sometimes we want to know how closely each Profile matches a theoretically
	# or empirically derived Profile (i.e., a template).
	# Here is the template for the optimally adjusted person in the CAQ.
opt.temp 
temp.match(opt.temp, caq)  # The overall template match scores
	# Now lets look at replicability of these template scores
temp.match.rep(opt.temp,caq)



