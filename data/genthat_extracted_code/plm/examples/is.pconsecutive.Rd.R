library(plm)


### Name: is.pconsecutive
### Title: Check if time periods are consecutive
### Aliases: is.pconsecutive is.pconsecutive.data.frame
###   is.pconsecutive.pdata.frame is.pconsecutive.panelmodel
###   is.pconsecutive.pseries is.pconsecutive.default
### Keywords: attribute

### ** Examples

data("Grunfeld", package = "plm")
is.pconsecutive(Grunfeld)
is.pconsecutive(Grunfeld, index=c("firm", "year"))

# delete 2nd row (2nd time period for first individual)
# -> non consecutive 
Grunfeld_missing_period <- Grunfeld[-2, ]
is.pconsecutive(Grunfeld_missing_period)
all(is.pconsecutive(Grunfeld_missing_period)) # FALSE

# delete rows 1 and 2 (1st and 2nd time period for first individual)
# -> consecutive
Grunfeld_missing_period_other <- Grunfeld[-c(1,2), ]
is.pconsecutive(Grunfeld_missing_period_other) # all TRUE

# delete year 1937 (3rd period) for _all_ individuals
Grunfeld_wo_1937 <- Grunfeld[Grunfeld$year != 1937, ]
is.pconsecutive(Grunfeld_wo_1937) # all FALSE

# pdata.frame interface
pGrunfeld <- pdata.frame(Grunfeld)
pGrunfeld_missing_period <- pdata.frame(Grunfeld_missing_period)
is.pconsecutive(pGrunfeld) # all TRUE
is.pconsecutive(pGrunfeld_missing_period) # first FALSE, others TRUE


# panelmodel interface (first, estimate some models)
mod_pGrunfeld <- plm(inv ~ value + capital, data = Grunfeld)
mod_pGrunfeld_missing_period <- plm(inv ~ value + capital, data = Grunfeld_missing_period)

is.pconsecutive(mod_pGrunfeld)
is.pconsecutive(mod_pGrunfeld_missing_period)

nobs(mod_pGrunfeld) # 200
nobs(mod_pGrunfeld_missing_period) # 199


# pseries interface
pinv <- pGrunfeld$inv
pinv_missing_period <- pGrunfeld_missing_period$inv

is.pconsecutive(pinv)
is.pconsecutive(pinv_missing_period)

# default method for arbitrary vectors or NULL
inv <- Grunfeld$inv
inv_missing_period <- Grunfeld_missing_period$inv
is.pconsecutive(inv, id = Grunfeld$firm, time = Grunfeld$year)
is.pconsecutive(inv_missing_period, id = Grunfeld_missing_period$firm, 
                                    time = Grunfeld_missing_period$year)

# (not run) demonstrate mismatch lengths of x, id, time 
# is.pconsecutive(x = inv_missing_period, id = Grunfeld$firm, time = Grunfeld$year)

# only id and time are needed for evaluation
is.pconsecutive(NULL, id = Grunfeld$firm, time = Grunfeld$year)



