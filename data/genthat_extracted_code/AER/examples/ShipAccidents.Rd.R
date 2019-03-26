library(AER)


### Name: ShipAccidents
### Title: Ship Accidents
### Aliases: ShipAccidents
### Keywords: datasets

### ** Examples

data("ShipAccidents")
sa <- subset(ShipAccidents, service > 0)

## Greene (2003), Table 21.20
## (see also McCullagh and Nelder, 1989, Table 6.3)
sa_full <- glm(incidents ~ type + construction + operation, family = poisson,
  data = sa, offset = log(service))
summary(sa_full)

sa_notype <- glm(incidents ~ construction + operation, family = poisson,
  data = sa, offset = log(service))
summary(sa_notype)

sa_noperiod <- glm(incidents ~ type + operation, family = poisson,
  data = sa, offset = log(service))
summary(sa_noperiod)

## model comparison
anova(sa_full, sa_notype, test = "Chisq")
anova(sa_full, sa_noperiod, test = "Chisq")

## test for overdispersion
dispersiontest(sa_full)
dispersiontest(sa_full, trafo = 2)



