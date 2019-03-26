library(validateRS)


### Name: power.target.Nclasses
### Title: Compute the alternative hypothesis' PDs by increasing the PDs
###   under the null hypothesis towards 1.
### Aliases: power.target.Nclasses

### ** Examples

data(ratingData)

p.0<-ratingData$p.0
sizes<-ratingData$sizes

h1A<-power.target.Nclasses(p.0=p.0, size=sizes[1,], N=length(p.0), 
                                 target=0.50)
h1A                                 

h1B<-power.target.Nclasses(p.0=p.0, size=sizes[,], N=1, 
                                 target=0.30)
h1B                                 




