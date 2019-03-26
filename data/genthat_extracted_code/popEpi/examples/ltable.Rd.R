library(popEpi)


### Name: ltable
### Title: Tabulate Counts and Other Functions by Multiple Variables into a
###   Long-Format Table
### Aliases: ltable expr.by.cj

### ** Examples

data("sire", package = "popEpi")
sr <- sire
sr$agegroup <- cut(sr$dg_age, breaks=c(0,45,60,75,85,Inf))
## counts by default
ltable(sr, "agegroup")

## any expression can be given
ltable(sr, "agegroup", list(mage = mean(dg_age)))
ltable(sr, "agegroup", list(mage = mean(dg_age), vage = var(dg_age)))

## also returns levels where there are zero rows (expressions as NA)
ltable(sr, "agegroup", list(obs = .N, 
                            minage = min(dg_age), 
                            maxage = max(dg_age)), 
       subset = dg_age < 85)
       
#### expr.by.cj
expr.by.cj(sr, "agegroup")

## any arbitrary expression can be given
expr.by.cj(sr, "agegroup", list(mage = mean(dg_age)))
expr.by.cj(sr, "agegroup", list(mage = mean(dg_age), vage = var(dg_age)))

## only uses levels of by.vars present in data
expr.by.cj(sr, "agegroup", list(mage = mean(dg_age), vage = var(dg_age)), 
           subset = dg_age < 70)
           
## .SDcols trick
expr.by.cj(sr, "agegroup", lapply(.SD, mean), 
           subset = dg_age < 70, .SDcols = c("dg_age", "status"))



