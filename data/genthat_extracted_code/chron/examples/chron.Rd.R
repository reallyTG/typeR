library(chron)


### Name: chron
### Title: Create a Chronological Object
### Aliases: chron as.chron as.chron.default as.chron.POSIXt as.chron.Date
###   as.chron.factor is.chron as.data.frame.chron print.chron
### Keywords: chron

### ** Examples

dts <- dates(c("02/27/92", "02/27/92", "01/14/92",
               "02/28/92", "02/01/92"))
dts
# [1] 02/27/92 02/27/92 01/14/92 02/28/92 02/01/92
tms <- times(c("23:03:20", "22:29:56", "01:03:30",
               "18:21:03", "16:56:26"))
tms
# [1] 23:03:20 22:29:56 01:03:30 18:21:03 16:56:26
x <- chron(dates = dts, times = tms)
x
# [1] (02/27/92 23:03:19) (02/27/92 22:29:56) (01/14/92 01:03:30)
# [4] (02/28/92 18:21:03) (02/01/92 16:56:26)

# We can add or subtract scalars (representing days) to dates or
# chron objects:
c(dts[1], dts[1] + 10)
# [1] 02/27/92 03/08/92
dts[1] - 31
# [1] 01/27/92

# We can substract dates which results in a times object that
# represents days between the operands:
dts[1] - dts[3]
# Time in days:
# [1] 44

# Logical comparisons work as expected:
dts[dts > "01/25/92"]
# [1] 02/27/92 02/27/92 02/28/92 02/01/92
dts > dts[3]
# [1]  TRUE  TRUE FALSE  TRUE  TRUE

# Summary operations which are sensible are permitted and work as
# expected:
range(dts)
# [1] 01/14/92 02/28/92
diff(x)
# Time in days:
# [1]  -0.02319444 -44.89335648  45.72052083 -27.05876157
sort(dts)[1:3]
# [1] 01/14/92 02/01/92 02/27/92



