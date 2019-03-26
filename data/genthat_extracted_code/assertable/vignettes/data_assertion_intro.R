## ---- echo=FALSE, results='asis'-----------------------------------------
library(assertable)

## ---- echo=FALSE, results='markup'---------------------------------------
head(CO2)

## ---- results='asis'-----------------------------------------------------
assert_nrows(CO2,84)

## ---- results='asis', error=TRUE-----------------------------------------
assert_nrows(CO2,80)

## ---- results='asis'-----------------------------------------------------
assert_colnames(CO2,c("Plant","Type","Treatment","conc","uptake"))

## ---- results='asis', error=TRUE-----------------------------------------
assert_colnames(CO2,c("Plant","Type","Treatment","conc","other_uptake"))

## ----  results='asis'----------------------------------------------------
assert_colnames(CO2,c("Plant","Type"), only_colnames=FALSE)

## ----  results='markup', error=TRUE--------------------------------------
CO2_miss <- CO2
CO2_miss[CO2_miss$Plant == "Qn2" & CO2_miss$conc == 175, "uptake"] <- NA
assert_values(CO2_miss, colnames=c("conc","uptake"), test="not_na")

## ---- results='markup'---------------------------------------------------
assert_values(CO2, colnames=c("conc","uptake"), test="not_na")

## ---- results='markup', error=TRUE---------------------------------------
CO2_inf <- CO2
CO2_inf[CO2_inf$Plant == "Qn2" & CO2_inf$conc == 175, "uptake"] <- Inf
assert_values(CO2_inf, colnames=c("conc","uptake"), test="not_inf")

## ----   results='markup', error=TRUE-------------------------------------
assert_values(CO2, colnames="uptake", test="gt", 0) # Are all values greater than 0?
assert_values(CO2, colnames="conc", test="lte", 1000) # Are all values less than/equal to 1000?
assert_values(CO2, colnames="uptake", test="lt", 40) # Are all values less than 40?

## ----   results='markup'-------------------------------------------------
assert_values(CO2, colnames="Treatment", test="in", test_val = c("nonchilled","chilled"))

## ----   results='markup'-------------------------------------------------
assert_values(CO2, colnames="Type", test="not_equal", "USA")
assert_values(CO2[CO2$Type == "Quebec",], colnames="Type", test="equal", "Quebec")

## ----   results='markup'-------------------------------------------------
CO2_mult <- CO2
CO2_mult$new_uptake <- CO2_mult$uptake * 2
assert_values(CO2, colnames="uptake", test="lt", CO2_mult$new_uptake)
assert_values(CO2, colnames="uptake", test="equal", CO2_mult$new_uptake/2)

## ----   results='markup', error=TRUE-------------------------------------
CO2_mult <- CO2
assert_values(CO2, colnames="uptake", test="gt", CO2_mult$new_uptake/2, display_rows=F)

## ----   results='markup', error=TRUE-------------------------------------
CO2_mult <- CO2
assert_values(CO2, colnames="uptake", test="lt", CO2_mult$conc, display_rows=F)
assert_values(CO2, colnames="uptake", test="gt", CO2_mult$conc * (1/50))

## ---- results='asis'-----------------------------------------------------
CO2_miss <- CO2
CO2_miss[CO2_miss$Plant == "Qn2" & CO2_miss$conc == 175, "uptake"] <- NA

## ----   results='markup', error=TRUE-------------------------------------
assert_values(CO2_miss, colnames=c("conc","uptake"), test="lt", 2000)

## ----   results='markup'-------------------------------------------------
assert_values(CO2_miss, colnames=c("conc","uptake"), test="lt", 2000, na.rm=T)

## ----   results='markup', error=TRUE-------------------------------------
plants <- as.character(unique(CO2$Plant))
treatments <- unique(CO2$Treatment)
concs <- unique(CO2$conc)

## ---- results='markup', error=TRUE---------------------------------------
ids <- list(Plant=plants)
assert_ids(CO2,ids)

## ---- results='markup'---------------------------------------------------
ids <- list(Plant=plants,conc=concs)
assert_ids(CO2, ids)

## ---- results='markup', error=TRUE---------------------------------------
ids <- list(Plant=plants,conc=concs)
CO2_dups <- rbind(CO2,CO2[CO2$Plant=="Mc2" & CO2$conc < 300,])
assert_ids(CO2_dups, ids)

## ---- results='markup', error=TRUE---------------------------------------
ids <- list(Plant=plants,conc=concs)
assert_ids(CO2_dups, ids, ids_only=F)

## ---- results='markup', warnings=TRUE------------------------------------
ids <- list(Plant=plants,conc=concs)
dup_rows <- assert_ids(CO2_dups, ids, ids_only=F, warn_only=T)
dup_rows

## ---- results='markup', error=TRUE---------------------------------------
## Add a new fake level to plants, use as.character because the "new_plant" level
## doesn't mix well with the factor level
new_plants <- c(as.character(plants),"new_plant")
ids <- list(Plant=new_plants,conc=concs)
dup_rows <- assert_ids(CO2_dups, ids)

## ---- results='markup', error=TRUE, warnings=TRUE------------------------
new_plants <- c(as.character(plants),"new_plant")
ids <- list(Plant=new_plants,conc=concs)
combos <- assert_ids(CO2_dups, ids, assert_dups = F, warn_only=T)
dup_rows <- assert_ids(CO2_dups, ids, assert_combos=F, ids_only=F, warn_only=T)

print(combos)
print(dup_rows)
if(!is.null(combos) | !is.null(dup_rows)) stop("assert_ids failed, see above for results")

