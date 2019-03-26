library(popEpi)


### Name: makeWeightsDT
### Title: Make a 'data.table' of Tabulated, Aggregated Values and Weights
### Aliases: makeWeightsDT

### ** Examples

library(survival)
library(data.table)

makeWeightsDT <- popEpi:::makeWeightsDT ## this avoids errors during tests

sire <- copy(popEpi::sire)
set.seed(1L)
sire$sex <- rbinom(nrow(sire), 1, 0.5)
ag <- lexpand(sire, birth = "bi_date", entry = "dg_date", exit = "ex_date",
              status = status %in% 1:2, pophaz = popmort, pp = FALSE,
              aggre = list(sex, agegr = cut(dg_age, c(0,50,75,Inf)), fot), 
              fot = seq(0, 5, 1/12))
ps <- quote(list(sex, fot))
as <- quote(list(agegr))
vs <- list(quote(list(pyrs, at.risk)))
ws <- list(agegr = c(0.2,0.4,0.4))

#### custom.levels usage
fb <- seq(0, 5-1/12, 1/12) ## exclude 5 as no row has that value
ag2 <- ag[fot > 0.5,]
# repeats fot intervals < 0.5 as empty rows
# may be the safest way to do this
dt <- makeWeightsDT(ag2, print = ps, adjust = as, 
                    values = vs, weights = ws,
                    custom.levels = list(fot = fb))
## aggregate from intervals seq(0, 5, 1/12) to 0:5
fb2 <- 0:5 ## (this time we include 5 as the roof)       
dt <- makeWeightsDT(ag2, print = ps, adjust = as, 
                    values = vs, weights = ws,
                    custom.levels = list(fot = fb2),
                    custom.levels.cut.low = "fot")              
                    

#### use of enclos
TF <- environment()
gender <- factor(ag$sex)
dt <- makeWeightsDT(ag, print = quote(gender), adjust = as, 
                    values = vs, weights = ws, enclos = TF)
## or NULL: uses calling frame by default.
dt <- makeWeightsDT(ag, print = quote(gender), adjust = as, 
                    values = vs, weights = ws,
                    enclos = NULL)
## passing parent.fram(1) is the same thing (as below),
## but won't pass in testing these examples somehow (but work in real life)
# dt <- makeWeightsDT(ag, print = quote(gender), adjust = as, 
#                     values = vs, weights = ws,
#                     enclos = NULL)                  

#### formula usage
form <- Surv(fot, factor(from0to1))~gender
dt <- makeWeightsDT(ag, formula = form, Surv.response = TRUE,
                    adjust = as, values = vs, weights = ws,
                    enclos = NULL)
                    
## or
form <- Surv(fot, factor(from0to1))~gender + adjust(agegr)
dt <- makeWeightsDT(ag, formula = form, Surv.response = TRUE,
                    adjust = NULL, values = vs, weights = ws,
                    enclos = NULL)
                    
## or   
form <- from0to1 ~ fot + gender + adjust(agegr)
dt <- makeWeightsDT(ag, formula = form, Surv.response = FALSE,
                    adjust = NULL, values = vs, weights = ws,
                    enclos = NULL)            

form <- from0to1 ~ fot + adjust(agegr) + adjust(sex)
ws2 <- list(agegr = c(0.33, 0.33, 0.33), sex = c(0.5, 0.5))
dt <- makeWeightsDT(ag, formula = form, Surv.response = FALSE,
                    adjust = NULL, values = vs, weights = ws2,
                    enclos = NULL)

## international standard pops
ag <- lexpand(sire, birth = "bi_date", entry = "dg_date", exit = "ex_date",
              status = status %in% 1:2, pophaz = popmort, pp = FALSE,
              aggre = list(sex, agegr = cut(dg_age, c(seq(0, 85, 5), Inf)), fot), 
              fot = seq(0, 5, 1/12))
              
form <- from0to1 ~ fot + adjust(agegr)
dt <- makeWeightsDT(ag, formula = form, Surv.response = FALSE,
                    adjust = NULL, values = vs, weights = "world_1966_18of5",
                    enclos = NULL)
                    
form <- from0to1 ~ fot + adjust(agegr, sex)
dt <- makeWeightsDT(ag, formula = form, Surv.response = FALSE,
                    adjust = NULL, values = vs, 
                    weights = list(agegr = "nordic_2000_18of5", sex=c(1,1)),
                    enclos = NULL)



