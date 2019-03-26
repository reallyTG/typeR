library(pscl)


### Name: tracex
### Title: trace plot of MCMC iterates, posterior density of legislators'
###   ideal points
### Aliases: tracex
### Keywords: hplot

### ** Examples

data(s109)
f <- system.file("extdata","id1.rda",package="pscl")
load(f)
tracex(id1,legis="KENN")

## n.b., no such legislator named Thomas Bayes
tracex(id1,legis=c("KENN","BOX","KYL","Thomas Bayes"))


f <- system.file("extdata","id2.rda",package="pscl")
load(f)

tracex(id2,d=1,legis=c("KENNEDY","BOXER","KYL","Thomas Bayes"))
tracex(id2,d=2,legis=c("KENNEDY","BOXER","KYL","Thomas Bayes"))
tracex(id2,d=1:2,
       legis=c("KENNEDY","BOXER","KYL","Thomas Bayes"))

## partial matching
tracex(id2,d=1:2,
       legis=c("KENN","BOX","BID","SNO","SPEC","MCCA","KYL",
               "Thomas Bayes"),
       multi=TRUE)



