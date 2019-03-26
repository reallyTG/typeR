library(multicon)


### Name: q.cor
### Title: Q Correlations
### Aliases: q.cor
### Keywords: q.cor correlations

### ** Examples

data(RSPdata)
data(v2rbq)
names(v2rbq)
q.obj <- q.cor(RSPdata$sEXT, v2rbq, sex = RSPdata$ssex, fem = 1, male = 2, sims = 1000)
q.obj	
	#It is often useful to summarize this object with print.
	#It might be necessary to adjust size of the width of your console to make this content fit.
data(rbqv3.items)
rbqv3.items #The item content for the rbq
print(q.obj, rbqv3.items, initial = "RBQ", short = TRUE, EXPORT = FALSE) 
	# to export a .csv file change export to a location.




