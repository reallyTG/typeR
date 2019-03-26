library(plm)


### Name: make.pconsecutive
### Title: Make data consecutive (and, optionally, also balanced)
### Aliases: make.pconsecutive make.pconsecutive.data.frame
###   make.pconsecutive.pdata.frame make.pconsecutive.pseries
### Keywords: attribute

### ** Examples

# take data and make it non-consecutive
# by deletion of 2nd row (2nd time period for first individual)
data("Grunfeld", package = "plm")
nrow(Grunfeld)                             # 200 rows
Grunfeld_missing_period <- Grunfeld[-2, ]
is.pconsecutive(Grunfeld_missing_period)   # check for consecutiveness
make.pconsecutive(Grunfeld_missing_period) # make it consecutiveness


# argument balanced:
# First, make data non-consecutive and unbalanced
# by deletion of 2nd time period (year 1936) for all individuals
# and more time periods for first individual only
Grunfeld_unbalanced <- Grunfeld[Grunfeld$year != 1936, ]
Grunfeld_unbalanced <- Grunfeld_unbalanced[-c(1,4), ]
all(is.pconsecutive(Grunfeld_unbalanced)) # FALSE
pdim(Grunfeld_unbalanced)$balanced        # FALSE

g_consec_bal <- make.pconsecutive(Grunfeld_unbalanced, balanced = TRUE)
all(is.pconsecutive(g_consec_bal)) # TRUE
pdim(g_consec_bal)$balanced        # TRUE
nrow(g_consec_bal)                 # 200 rows
head(g_consec_bal)                 # 1st individual: years 1935, 1936, 1939 are NA

g_consec <- make.pconsecutive(Grunfeld_unbalanced) # default: balanced = FALSE
all(is.pconsecutive(g_consec)) # TRUE
pdim(g_consec)$balanced        # FALSE
nrow(g_consec)                 # 198 rows
head(g_consec)                 # 1st individual: years 1935, 1936 dropped, 1939 is NA 


# NA in 1st, 3rd time period (years 1935, 1937) for first individual
Grunfeld_NA <- Grunfeld
Grunfeld_NA[c(1, 3), "year"] <- NA
g_NA <- make.pconsecutive(Grunfeld_NA)
head(g_NA)        # 1936 is begin for 1st individual, 1937: NA for non-index vars
nrow(g_NA)        # 199, year 1935 from original data is dropped


# pdata.frame interface
pGrunfeld_missing_period <- pdata.frame(Grunfeld_missing_period)
make.pconsecutive(Grunfeld_missing_period)


# pseries interface
make.pconsecutive(pGrunfeld_missing_period$inv)


# comparison to make.pbalanced (makes the data only balanced, not consecutive)
g_bal <- make.pbalanced(Grunfeld_unbalanced)
all(is.pconsecutive(g_bal)) # FALSE
pdim(g_bal)$balanced        # TRUE
nrow(g_bal) # 190 rows



