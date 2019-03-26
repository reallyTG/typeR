library(popEpi)


### Name: rate
### Title: Direct-Standardised Incidence/Mortality Rates
### Aliases: rate

### ** Examples

## Prepare data with lexpand and then reformat agegroup.
data(sibr)
x <- lexpand(sibr, birth = bi_date, entry = dg_date, exit = ex_date,  
             breaks = list(per = c(1990,2000,2010,2020), age = c(0:17*5,Inf)),
             aggre = list(agegroup = age, year.cat = per),
             status =  status != 0)

x$agegroup <- cut(x$agegroup,  c(0:17*5,Inf), right = FALSE)

## calculate rates for selected periods with Nordic 2000 weights:
r1 <- rate( data = x, obs = from0to1, pyrs = pyrs, print = year.cat, 
            adjust = agegroup, weights = 'nordic')
r1

## use total person-years by stratum as weights (some have zero)
w <- ltable(x, by.vars = "agegroup", expr = sum(pyrs))
w[is.na(w$V1),]$V1 <- 0

r2 <- rate( data = x, obs = from0to1, pyrs = pyrs, print = year.cat, 
            adjust = agegroup,
            weights = w$V1)
r2

## use data.frame of weights:
names(w) <- c("agegroup", "weights")
r2 <- rate( data = x, obs = from0to1, pyrs = pyrs, print = year.cat, 
            adjust = agegroup,
            weights = w)
r2

## internal weights (same result as above)
r3 <- rate( data = x, obs = from0to1, pyrs = pyrs, print = year.cat, 
            adjust = agegroup,
            weights = "internal")
r3




