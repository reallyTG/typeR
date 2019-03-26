library(popEpi)


### Name: aggre
### Title: Aggregation of split 'Lexis' data
### Aliases: aggre

### ** Examples


## form a Lexis object
library(Epi)
data(sibr)
x <- sibr[1:10,]
x[1:5,]$sex <- 0 ## pretend some are male
x <- Lexis(data = x,
           entry = list(AGE = dg_age, CAL = get.yrs(dg_date)),
           exit = list(CAL = get.yrs(ex_date)),
           entry.status=0, exit.status = status)
x <- splitMulti(x, breaks = list(CAL = seq(1993, 2013, 5), 
                                 AGE = seq(0, 100, 50)))

## these produce the same results (with differing ways of determining aggre)
a1 <- aggre(x, by = list(gender = factor(sex, 0:1, c("m", "f")), 
             agegroup = AGE, period = CAL))

a2 <- aggre(x, by = c("sex", "AGE", "CAL"))

a3 <- aggre(x, by = list(sex, agegroup = AGE, CAL))

## returning also empty levels
a4 <- aggre(x, by = c("sex", "AGE", "CAL"), type = "full")

## computing also expected numbers of cases
x <- lexpand(sibr[1:10,], birth = bi_date, entry = dg_date,
             exit = ex_date, status = status %in% 1:2, 
             pophaz = popmort, fot = 0:5, age = c(0, 50, 100))
x$d.exp <- with(x, lex.dur*pop.haz)
## these produce the same result
a5 <- aggre(x, by = c("sex", "age", "fot"), sum.values = list(d.exp))
a5 <- aggre(x, by = c("sex", "age", "fot"), sum.values = "d.exp")
a5 <- aggre(x, by = c("sex", "age", "fot"), sum.values = d.exp)
## same result here with custom name
a5 <- aggre(x, by = c("sex", "age", "fot"), 
             sum.values = list(expCases = d.exp))
             
## computing pohar-perme weighted figures
x$d.exp.pp <- with(x, lex.dur*pop.haz*pp)
a6 <- aggre(x, by = c("sex", "age", "fot"), 
             sum.values = c("d.exp", "d.exp.pp"))
## or equivalently e.g. sum.values = list(expCases = d.exp, expCases.p = d.exp.pp).



