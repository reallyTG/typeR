library(PortfolioEffectHFT)


### Name: portfolio-class
### Title: Class '"portfolio"'
### Aliases: portfolio-class plot,portfolio,missing-method
###   plot,portfolio,ANY-method
###   position_add,portfolio,character,ANY,ANY,matrix-method
###   position_add,portfolio,character,ANY,ANY,missing-method
###   position_add,portfolio,character,ANY,missing,matrix-method
###   position_add,portfolio,character,ANY,missing,missing-method
###   portfolio_create,portfolio,missing,missing,missing-method
###   show,portfolio-method
### Keywords: PortfolioEffectHFT classes

### ** Examples

showClass("portfolio")
## Not run: 
##D portfolio=portfolio_create(fromTime="2014-10-02 09:30:00", toTime="2014-10-02 16:00:00")
##D portfolio_settings(portfolio,resultsSamplingInterval='60s')
##D positionSPY=position_add(portfolio,'SPY',500)
##D positionC=position_add(portfolio,'C',600)
##D plot(portfolio,font_size=7,bw=T)
## End(Not run)



