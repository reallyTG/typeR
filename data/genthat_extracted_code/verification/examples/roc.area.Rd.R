library(verification)


### Name: roc.area
### Title: Area under curve (AUC) calculation for Response Operating
###   Characteristic curve.
### Aliases: roc.area
### Keywords: file

### ** Examples
# Data used from Mason and Graham (2002).
a<- c(1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990,
 1991, 1992, 1993, 1994, 1995)
b<- c(0,0,0,1,1,1,0,1,1,0,0,0,0,1,1)
c<- c(.8, .8, 0, 1,1,.6, .4, .8, 0, 0, .2, 0, 0, 1,1)
d<- c(.928,.576, .008, .944, .832, .816, .136, .584, .032, .016, .28, .024, 0, .984, .952)

A<- data.frame(a,b,c, d)
names(A)<- c("year", "event", "p1", "p2")

## for model with ties
roc.area(A$event, A$p1)

## for model without ties
roc.area(A$event, A$p2)





