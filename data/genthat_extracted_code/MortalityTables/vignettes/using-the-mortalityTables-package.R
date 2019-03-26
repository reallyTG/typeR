## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----message=FALSE-------------------------------------------------------
library("MortalityTables")

## ------------------------------------------------------------------------
# list all available data sets
mortalityTables.list()

# list all datasets for Austria
mortalityTables.list("Austria_*")

# Load the German annuity table DAV 2004-R
mortalityTables.load("Germany_Annuities_DAV2004R")

# Load all Austrian data sets
mortalityTables.load("Austria_*")

## ------------------------------------------------------------------------
# Log-linear plot comparing some Austrian census tables
plot(mort.AT.census.1951.male, mort.AT.census.1991.male, 
     mort.AT.census.2001.male, mort.AT.census.2011.male, 
     legend.position = c(1,0))

# Relative death probabilities in percentage of the latest census
plot(mort.AT.census.1951.male, mort.AT.census.1991.male, 
     mort.AT.census.2001.male, 
     reference = mort.AT.census.2011.male, legend.position = c(1,0.75), ylim = c(0,4))

## ------------------------------------------------------------------------
# Comparison of two Austrian annuity tables for birth year 1977
plot(AVOe1996R.male, AVOe2005R.male, YOB = 1977, title = "Comparison for YOB=1977")

# Comparison of two Austrian annuity tables for observation year 2020
plot(AVOe1996R.male, AVOe2005R.male, Period = 2020, title = "Comparison for observation year 2020")


## ----message=FALSE-------------------------------------------------------
mortalityTables.load("Austria_Annuities")
# Get the cohort death probabilities for Austrian Annuitants born in 1977:
qx.coh1977 = deathProbabilities(AVOe2005R.male, YOB = 1977)

# Get the period death probabilities for Austrian Annuitants observed in the year 2020:
qx.per2020 = periodDeathProbabilities(AVOe2005R.male, Period = 2020)

## ------------------------------------------------------------------------
# Get the cohort death probabilities for Austrian Annuitants born in 1977 as a mortalityTable.period object:
table.coh1977 = getCohortTable(AVOe2005R.male, YOB = 1977)

# Get the period death probabilities for Austrian Annuitants observed in the year 2020:
table.per2020 = getPeriodTable(AVOe2005R.male, Period = 2020)

# Compare those two in a plot:
plot(table.coh1977, table.per2020, title = "Comparison of cohort 1977 with Period 2020", legend.position = c(1,0))


## ------------------------------------------------------------------------
lt = mortalityTable.period(name = "Sample period lifetable", ages = 1:99, deathProbs = exp(-(99:1)/10))
plot(lt, title = "Simple log-linear period mortality table")
deathProbabilities(lt)


## ------------------------------------------------------------------------
atPlus2 = mortalityTable.trendProjection(
    name = "Austrian Census Males 2011, 2% yearly trend",
    baseYear = 2011,
    deathProbs = deathProbabilities(mort.AT.census.2011.male),
    ages = ages(mort.AT.census.2011.male),
    trend = rep(0.02, length(ages(mort.AT.census.2011.male)))
)

## ------------------------------------------------------------------------
atPlus2.damp = mortalityTable.trendProjection(
    name = "Austrian M '11, 2% yearly, damping until 2111",
    baseYear = 2011,
    deathProbs = deathProbabilities(mort.AT.census.2011.male),
    ages = ages(mort.AT.census.2011.male),
    trend = rep(0.02, length(ages(mort.AT.census.2011.male))),
    # damping function: 2011: full effect, linear reduction until yearly trend=0 in 2111:
    # 2011: 100%, 2012: 99%, 2013: 98% => For 2013 we have a cumulative trend 
    # of 297% instead of 300% for three full yearly trends!
    dampingFunction = function(n) { n - n * (n + 1) / 2 / 100 }
)

plot(mort.AT.census.2011.male, atPlus2, atPlus2.damp, YOB = 2011, legend.position = c(0.8,0.75))

## ------------------------------------------------------------------------
atPlus2.damp2 = mortalityTable.trendProjection(
    name = "Austrian M '11, 2% yearly, 1% long-term",
    baseYear = 2011,
    deathProbs = deathProbabilities(mort.AT.census.2011.male),
    ages = ages(mort.AT.census.2011.male),
    trend = rep(0.02, length(ages(mort.AT.census.2011.male))),
    trend2 = rep(0.01, length(ages(mort.AT.census.2011.male))),
    # damping function interpolates between the two trends: 
    # until 2021 trend 1, from 2031 trend 2, linearly beteen
    dampingFunction = function(year) { 
        if (year <= 2021) 1
        else if (year > 2031) 14.5/(year - 2011)
        else 1 - (year - 2021)*(year - 2021 + 1) / 20 / (year - 2011)
    }
)

plot(mort.AT.census.2011.male, atPlus2, atPlus2.damp, atPlus2.damp2, YOB = 2011, legend.position = c(0.8,0.75))

## ------------------------------------------------------------------------
baseTableShift = getCohortTable(atPlus2, YOB = 2011);
baseTableShift@name = "Base table of the shift (YOB 2011)"

atShifted = mortalityTable.ageShift(
    name = "Approximation with age shift",
    baseYear = 2011,
    deathProbs = deathProbabilities(baseTableShift),
    ages = ages(baseTableShift),
    ageShifts = data.frame(
        shifts = c(
            rep( 0, 3), 
            rep(-1, 3), 
            rep(-2, 3), 
            rep(-3, 3), 
            rep(-4, 3), 
            rep(-5, 3), 
            rep(-6, 3)
        ),
        row.names = 2011:2031
    )
)

ageShift(atShifted, YOB = 2021)

plot(baseTableShift, atPlus2, atShifted, YOB = 2021, legend.position = c(0.8,0.75))

## ------------------------------------------------------------------------
b = AVOe2005R.female 
b@name = "Modified Copy"
# only b is modified, not the original table
b@modification = function(qx) pmax(qx, 0.01)  
plot(AVOe2005R.female, b, YOB = 2000)

## ------------------------------------------------------------------------
AVOe2005R.female.sec = setLoading(AVOe2005R.female, loading = 0.1);
# Make sure the modified table has a new name, otherwise plots might break
AVOe2005R.female.sec@name = "Table with 10% loading"
plot(AVOe2005R.female, AVOe2005R.female.sec, title = "Original and modified table")

## ------------------------------------------------------------------------
AVOe2005R.female.mod = setModification(AVOe2005R.female, modification = function(qx) pmax(0.03, qx));
# Make sure the modified table has a new name, otherwise plots might break
AVOe2005R.female.mod@name = "Modified table (lower bound of 3%)"
plot(AVOe2005R.female, AVOe2005R.female.mod, title = "Original and modified table")

