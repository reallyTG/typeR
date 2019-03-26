library(blscrapeR)


### Name: qcew_api
### Title: Request data from the Quarterly Census of Employment and Wages.
### Aliases: qcew_api
### Keywords: api bls cpi economics inflation unemployment

### ** Examples


# A request for the employment levels and wages for NIACS 5112: Software Publishers.
dat <- qcew_api(year=2017, qtr="a", slice="industry", sliceCode=5112)





