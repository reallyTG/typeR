library(popEpi)


### Name: Lexis_fpa
### Title: Create a Lexis Object with Follow-up Time, Period, and Age Time
###   Scales
### Aliases: Lexis_fpa

### ** Examples


data("sire", package = "popEpi")

lex <- Lexis_fpa(sire, 
                 birth = "bi_date", 
                 entry = dg_date, 
                 exit = ex_date + 1L,
                 exit.status = "status")

## some special cases
myVar <- "bi_date"
l <- list(myVar = "bi_date")
sire$l <- sire$myVar <- 1

## conflict: myVar taken from data when "bi_date" was intended
lex <- Lexis_fpa(sire, 
                 birth = myVar, 
                 entry = dg_date, 
                 exit = ex_date + 1L,
                 exit.status = "status")

## no conflict with names in data
lex <- Lexis_fpa(sire, 
                 birth = l$myVar, 
                 entry = dg_date, 
                 exit = ex_date + 1L,
                 exit.status = "status")



