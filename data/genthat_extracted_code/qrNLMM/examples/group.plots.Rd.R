library(qrNLMM)


### Name: group.plots
### Title: Plot function for grouped data
### Aliases: group.plots group.plot group.lines group.points
### Keywords: plot grouped data plot nested data mixed models

### ** Examples

## Not run: 
##D #A full profile plot for Soybean data
##D 
##D data(Soybean)
##D attach(Soybean)
##D 
##D group.plot(x = Time,y = weight,groups = Plot,type="b",
##D              main="Soybean profiles",xlab="time (days)",
##D              ylab="mean leaf weight (gr)")
##D 
##D #Profile plot by genotype
##D 
##D group.plot(x = Time[Variety=="P"],y = weight[Variety=="P"],
##D              groups = Plot[Variety=="P"],type="l",col="blue",
##D              main="Soybean profiles by genotype",xlab="time (days)",
##D              ylab="mean leaf weight (gr)")
##D 
##D group.lines(x = Time[Variety=="F"],y = weight[Variety=="F"],
##D               groups = Plot[Variety=="F"],col="black")
## End(Not run)



