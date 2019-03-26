library(ems)


### Name: miscellaneous
### Title: Miscellaneous functions for data editing
### Aliases: miscellaneous f.num f.date remove.na tab2tex trunc_num
###   dummy.columns rm.dummy.columns funnelEstimate winsorising

### ** Examples

# Formating character or factor variable that should be numeric variables
f.num(c("2,4000","10,0000","5.0400"))

# Simulating a dataset
y <- data.frame(v1 = sample(c(" F","M  ","   "), 10, replace = TRUE),
                v2 = sample(c(1:3,"     "), 10, replace = TRUE),
                v3 = sample(c("Alive","Dead",""), 10, replace = TRUE))
y

# Replacing the "" cells by NA
y <- remove.na(y)
y

rm(y)

# Formating dates
x <- f.date(c("28/02/2013","16/07/1998","31/03/2010"))
x
class(x)

# The first element (i.e., the different one) is coerced to NA
x <- f.date(c("2013-02-28 12:40","16/07/1998","31/03/2010"))
x
class(x)

# The last element (i.e. the different one) is coerced to NA
x <- f.date(c("2013-02-28 12:40","1998-07-16 18:50","31/03/2010"))
x
class(x)

# Truncating numeric vectors
trunc_num(1:12, min = 3, max = 10)

# Truncating numeric vectors but returning NAs instead
trunc_num(1:12, min = 3, max = 10, toNA = TRUE)

# Simulating a dataset for dummy.columns example

y <- data.frame(v1 = 1:20,
               v2 = sapply(1:20, function(i) toString(sample(c("Code1","Code2","Code3","Code4"),
                     size = sample(2:4, 1), replace = FALSE))))
y


# For a few of the codes in the original column
y <- dummy.columns(y, original.column = "v2", factor = c("Code2","Code3"))
y

# For all codes in the original column
y <- dummy.columns(y[, 1:2], original.column = "v2", scan.oc = TRUE)
y

# Funnel Estimate
data(icu)
icu

funnelEstimate(y = icu$Saps3DeathProbabilityStandardEquation,
               range = 1, u = length(unique(icu$Unit)),
               totalAdmissions = nrow(icu),
               totalObserved = sum(icu$UnitDischargeName),
               theta = mean(icu$Saps3DeathProbabilityStandardEquation),
               dist = 'normal', rho = 1, gdetheta = 1)

rm(y, icu)




