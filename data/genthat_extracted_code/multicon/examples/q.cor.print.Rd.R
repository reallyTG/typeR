library(multicon)


### Name: q.cor.print
### Title: Print q.cor
### Aliases: q.cor.print
### Keywords: q.cor print

### ** Examples

data(rbqv3.items)
data(RSPdata)
data(v2rbq)
names(v2rbq)
q.obj <- q.cor(RSPdata$sEXT, v2rbq, sex = RSPdata$ssex, fem = 1, male = 2, sims = 1000)
	#It might be necessary to adjust size of the width of your console to make this content fit.
q.cor.print(q.obj, rbqv3.items, initial = "RBQ", short = TRUE, EXPORT = FALSE)



