library(atus)


### Name: atusresp
### Title: ATUS Respondent Information (2003-2016)
### Aliases: atusresp
### Keywords: datasets

### ** Examples

data(atusresp)

hist(atusresp$weekly_earn, main="Distribution of Weekly Earnings of ATUS Respondents (all years)")
boxplot(weekly_earn ~ tuyear, data=atusresp, horizontal=TRUE, las=1,
        main="Weekly Earnings by Year", xlab="Year", ylab="Weekly Earnings")



