library(hyfo)


### Name: fillGap
### Title: Fill gaps in the rainfall time series.
### Aliases: fillGap

### ** Examples

b <- read.table(text = '        Date  AAA  BBB  CCC  DDD  EEE
49 1999-12-15 24.8 21.4 25.6 35.0 17.4
50 1999-12-16   NA  0.6  1.5  6.3  2.5
51 1999-12-17   NA 16.3 20.3  NA 19.2
52 1999-12-18   13  1.6 NA  6.3  0.0
53 1999-12-19   10 36.4 12.5 26.8 24.9
54 1999-12-20   NA  0.0  0.0  0.2  0.0
55 1999-12-21  0.2  0.0  0.0  0.0  0.0
56 1999-12-22  0.0  0.0  0.0  0.0  0.0')

b1 <- fillGap(b) # if corPeriod is missing, 'daily' is taken as default.

data(testdl)
a <- extractPeriod(testdl, commonPeriod = TRUE)
a1 <- list2Dataframe(a)
a2 <- fillGap(a1)
a3 <- fillGap(a1, corPeriod = 'monthly')


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




