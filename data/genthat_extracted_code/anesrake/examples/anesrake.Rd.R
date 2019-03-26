library(anesrake)


### Name: anesrake
### Title: Function to perform full ANES variable selection and weighting.
### Aliases: anesrake print.anesrake summary.anesrake
### Keywords: ~raking ~variable selection ~weights

### ** Examples

data("anes04")

anes04$caseid <- 1:length(anes04$age)

anes04$agecats <- cut(anes04$age, c(0, 25,35,45,55,65,99))
levels(anes04$agecats) <- c("age1824", "age2534", "age3544",
          "age4554", "age5564", "age6599")

marriedtarget <- c(.4, .6)

agetarg <- c(.10, .15, .17, .23, .22, .13)
names(agetarg) <- c("age1824", "age2534", "age3544",
          "age4554", "age5564", "age6599")

targets <- list(marriedtarget, agetarg)

names(targets) <- c("married", "agecats")

outsave <- anesrake(targets, anes04, caseid=anes04$caseid,
          verbose=TRUE)

caseweights <- data.frame(cases=outsave$caseid, weights=outsave$weightvec)

summary(caseweights)

summary(outsave)



