library(epitools)


### Name: ageadjust.indirect
### Title: Age standardization by indirect method, with exact confidence
###   intervals
### Aliases: ageadjust.indirect
### Keywords: models

### ** Examples

##From Selvin (2004)
##enter data
dth60 <- c(141, 926, 1253, 1080, 1869, 4891, 14956, 30888,
41725, 26501, 5928)

pop60 <- c(1784033, 7065148, 15658730, 10482916, 9939972,
10563872, 9114202, 6850263, 4702482, 1874619, 330915)

dth40 <- c(45, 201, 320, 670, 1126, 3160, 9723, 17935,
22179, 13461, 2238)

pop40 <- c(906897, 3794573, 10003544, 10629526, 9465330,
8249558, 7294330, 5022499, 2920220, 1019504, 142532)

##calculate age-specific rates
rate60 <- dth60/pop60
rate40 <- dth40/pop40

#create array for display
tab <- array(c(dth60, pop60, round(rate60*100000,1), dth40, pop40,
round(rate40*100000,1)),c(11,3,2))
agelabs <- c("<1", "1-4", "5-14", "15-24", "25-34", "35-44", "45-54",
"55-64", "65-74", "75-84", "85+")
dimnames(tab) <- list(agelabs,c("Deaths", "Population", "Rate"),
c("1960", "1940"))
tab

##implement direct age standardization using 'ageadjust.direct'
dsr <- ageadjust.direct(count = dth40, pop = pop40, stdpop = pop60)
round(100000*dsr, 2) ##rate per 100,000 per year

##implement indirect age standardization using 'ageadjust.indirect'
isr <- ageadjust.indirect(count = dth40, pop = pop40,
                          stdcount = dth60, stdpop = pop60)
round(isr$sir, 2)         ##standarized incidence ratio
round(100000*isr$rate, 1) ##rate per 100,000 per year




