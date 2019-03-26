library(TFX)


### Name: TFX
### Title: TFX package: An R interface to the TrueFX(tm) Market Data Web
###   API
### Aliases: TFX TFX-package
### Keywords: IO package programming

### ** Examples

## Not run: 
##D ## Unauthenticated
##D QueryTrueFX()
##D QueryTrueFX(pretty=FALSE)
##D 
##D ## Must have a TrueFX(tm) account to run the following (Membership is free)
##D ## Replace JSTrader and Ou812 with your username and password, respectively
##D id <- ConnectTrueFX("EUR/USD,AUD/JPY", u='JSTrader', p='Ou812', f='html')
##D QueryTrueFX(id)
##D 
##D browseURL(paste0("http://webrates.truefx.com/rates/connect.html?id=", id))
##D 
##D #view the Web API Developer Guide:
##D TrueFXRef()
## End(Not run)



