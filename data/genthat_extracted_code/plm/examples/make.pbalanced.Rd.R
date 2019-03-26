library(plm)


### Name: make.pbalanced
### Title: Make data balanced
### Aliases: make.pbalanced make.pbalanced.data.frame
###   make.pbalanced.pdata.frame make.pbalanced.pseries
### Keywords: attribute

### ** Examples

# take data and make it unbalanced
# by deletion of 2nd row (2nd time period for first individual)
data("Grunfeld", package = "plm")
nrow(Grunfeld)                            # 200 rows
Grunfeld_missing_period <- Grunfeld[-2, ]
pdim(Grunfeld_missing_period)$balanced    # check if balanced: FALSE
make.pbalanced(Grunfeld_missing_period)   # make it balanced (by filling)
make.pbalanced(Grunfeld_missing_period, balance.type = "shared.times") # (shared periods)
nrow(make.pbalanced(Grunfeld_missing_period))
nrow(make.pbalanced(Grunfeld_missing_period, balance.type = "shared.times"))

# more complex data:
# First, make data unbalanced (and non-consecutive) 
# by deletion of 2nd time period (year 1936) for all individuals
# and more time periods for first individual only
Grunfeld_unbalanced <- Grunfeld[Grunfeld$year != 1936, ]
Grunfeld_unbalanced <- Grunfeld_unbalanced[-c(1,4), ]
pdim(Grunfeld_unbalanced)$balanced        # FALSE
all(is.pconsecutive(Grunfeld_unbalanced)) # FALSE

g_bal <- make.pbalanced(Grunfeld_unbalanced)
pdim(g_bal)$balanced        # TRUE
unique(g_bal$year)          # all years but 1936
nrow(g_bal)                 # 190 rows
head(g_bal)                 # 1st individual: years 1935, 1939 are NA

# NA in 1st, 3rd time period (years 1935, 1937) for first individual
Grunfeld_NA <- Grunfeld
Grunfeld_NA[c(1, 3), "year"] <- NA
g_bal_NA <- make.pbalanced(Grunfeld_NA)
head(g_bal_NA)        # years 1935, 1937: NA for non-index vars
nrow(g_bal_NA)        # 200

# pdata.frame interface
pGrunfeld_missing_period <- pdata.frame(Grunfeld_missing_period)
make.pbalanced(Grunfeld_missing_period)

# pseries interface
make.pbalanced(pGrunfeld_missing_period$inv)

# comparison to make.pconsecutive
g_consec <- make.pconsecutive(Grunfeld_unbalanced)
all(is.pconsecutive(g_consec)) # TRUE
pdim(g_consec)$balanced        # FALSE
head(g_consec, 22)             # 1st individual:   no years 1935/6; 1939 is NA; 
                               # other indviduals: years 1935-1954, 1936 is NA
nrow(g_consec)                 # 198 rows

g_consec_bal <- make.pconsecutive(Grunfeld_unbalanced, balanced = TRUE)
all(is.pconsecutive(g_consec_bal)) # TRUE
pdim(g_consec_bal)$balanced        # TRUE
head(g_consec_bal)                 # year 1936 is NA for all individuals
nrow(g_consec_bal)                 # 200 rows

head(g_bal)                        # no year 1936 at all
nrow(g_bal)                        # 190 rows



