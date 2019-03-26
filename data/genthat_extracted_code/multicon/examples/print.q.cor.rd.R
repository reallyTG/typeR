library(multicon)


### Name: print.q.cor
### Title: Print q.cor object
### Aliases: print.q.cor
### Keywords: q.cor print

### ** Examples

data(rbqv3.items)
data(RSPdata)
data(v2rbq)
names(v2rbq)
q.obj <- q.cor(RSPdata$sEXT, v2rbq, sex = RSPdata$ssex, fem = 1, male = 2, sims = 1000)
	#It might be necessary to adjust size of the width of your console to make this content fit.
print(q.obj) # Accepting only the default arguments
  # Taking advantage of the other arguments
print(q.obj, var.content = rbqv3.items, initial = "RBQ", short = TRUE, EXPORT = FALSE)



