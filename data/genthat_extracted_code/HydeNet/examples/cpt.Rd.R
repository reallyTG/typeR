library(HydeNet)


### Name: cpt
### Title: Compute a conditional probability table for a factor given other
###   factors
### Aliases: cpt cpt.formula cpt.list inputCPT inputCPT.formula
###   inputCPT.list

### ** Examples

# a very imbalanced dice example

n <- 50000
data <- data.frame(
  di1 = as.factor(1:6 %*% rmultinom(n,1,prob=c(.4,.3,.15,.10,.03,.02))),
  di2 = as.factor(1:6 %*% rmultinom(n,1,prob=rev(c(.4,.3,.15,.10,.03,.02)))),
  di3 = as.factor(1:6 %*% rmultinom(n,1,prob=c(.15,.10,.02,.3,.4,.03)))
)

cpt1 <- cpt(di3 ~ di1 + di2, data)
cpt1[di1 = 1, di2 = 4, ]  # Pr(di3 | di1 = 1, di2 = 4)
cpt1["1","4",]
cpt1[1,4,]

plyr::aaply(cpt1, c(1,2), sum) # card(di1)*card(di2) matrix of ones

l <- list(y = "di3", x = c("di1","di2"))
all(cpt(l, data) == cpt1)

## Not run: 
##D inputCPT(wetGrass ~ rain + morning) 
##D 
##D inputCPT(wetGrass ~ rain + morning,
##D          factorLevels <- list(wetGrass = c("dry","moist","VeryWet"),
##D                               rain     = c("nope","yep"),
##D                               morning  = c("NO","YES")),
##D          reduce = FALSE)
## End(Not run)




