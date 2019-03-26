library(tsfa)


### Name: estTSFmodel
### Title: Estimate Time Series Factor Model
### Aliases: estTSFmodel estTSF.ML
### Keywords: ts

### ** Examples

  if (require("CDNmoney")){
    data("CanadianMoneyData.asof.28Jan2005", package="CDNmoney")
    data("CanadianCreditData.asof.28Jan2005", package="CDNmoney")
 
    z <- tframed(tbind(
  	MB2001,
  	MB486 + MB452 + MB453 ,
  	NonbankCheq,
  	MB472 + MB473 + MB487p,
  	MB475,
  	NonbankNonCheq + MB454 + NonbankTerm + MB2046 + MB2047 + MB2048 +
  	MB2057 + MB2058 + MB482),
  	names=c("currency", "personal cheq.", "NonbankCheq",
  	"N-P demand & notice", "N-P term", "Investment" )
      )
 
    z <- tfwindow(tbind (z, ConsumerCredit, ResidentialMortgage,
  			    ShortTermBusinessCredit, OtherBusinessCredit),
  	 start=c(1981,11), end=c(2004,11))
 
    cpi <- 100 * M1total / M1real
    popm <- M1total / M1PerCapita
    scale <- tfwindow(1e8 /(popm * cpi), tf=tframe(z))

    MBandCredit <- sweep(z, 1, scale, "*")
    c4withML  <- estTSF.ML(MBandCredit, 4)
    tfplot(ytoypc(factors(c4withML)),
  	   Title="Factors from 4 factor model (year-to-year growth rate)")
    tfplot(c4withML, graphs.per.page=3)
    summary(c4withML)
    summary(TSFmodel(c4withML))
  }



