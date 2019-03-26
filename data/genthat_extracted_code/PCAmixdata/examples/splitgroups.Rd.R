library(PCAmixdata)


### Name: splitgroups
### Title: splitgroups
### Aliases: splitgroups

### ** Examples

data(decathlon)
split <- splitgroups(decathlon,groups=c(rep(1,10),2,2,3),
          name.groups=c("Epreuve","Classement","Competition"))
split$data.groups$Epreuve



