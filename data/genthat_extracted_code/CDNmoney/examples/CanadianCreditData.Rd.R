library(CDNmoney)


### Name: CanadianCreditData
### Title: Canadian Credit Aggregates
### Aliases: CanadianCreditData CanadianCreditData.asof.6Mar2009
###   CanadianCreditData.asof.5Jun2007 CanadianCreditData.asof.3Mar2006
###   CanadianCreditData.asof.28Jan2005 TotalCredit ConsumerCredit
###   ResidentialMortgage ShortTermBusinessCredit OtherBusinessCredit
### Keywords: datasets

### ** Examples

 require("tframe")
 require("tfplot")
 data("CanadianCreditData", package="CDNmoney")

 tfplot(TotalCredit, ConsumerCredit, ResidentialMortgage,
    ShortTermBusinessCredit, OtherBusinessCredit) 
 tfplot(tbind(TotalCredit, ConsumerCredit, ResidentialMortgage,
    ShortTermBusinessCredit, OtherBusinessCredit), graphs.per.page=3 ) 

 tfplot(diff(tbind(TotalCredit, ConsumerCredit, ResidentialMortgage,
    ShortTermBusinessCredit, OtherBusinessCredit)), graphs.per.page=3 ) 

 tfplot(tbind(TotalCredit, ConsumerCredit, ResidentialMortgage,
    ShortTermBusinessCredit, OtherBusinessCredit), graphs.per.page=3, 
    start=c(1990,6), end=c(1991,6)) 



