library(multicon)


### Name: temp.resid
### Title: Residuals from Template Prediction
### Aliases: temp.resid
### Keywords: template matching residuals

### ** Examples

data(opt.temp)
data(caq)
	# Template Matching
	# Sometimes we want to know how closely each Profile matches a theoretically
	# or empirically derived Profile (i.e., a template).
	# Here is the template for the optimally adjusted person in the CAQ.
opt.temp 
temp.match(opt.temp, caq)  # The overall template match scores
	# Now if we want what is left after removing the template from each profile...
caq.opt.resids <- temp.resid(opt.temp, caq) 
head(caq.opt.resids)




