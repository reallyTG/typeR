library(RSauceLabs)


### Name: deleteTunnel
### Title: Delete Tunnel
### Aliases: deleteTunnel

### ** Examples

## Not run: 
##D myAcc <- account()
##D myTunnels <- getTunnels(myAcc)
##D #> myTunnels
##D #list()
##D # A tunnel needs to be started with sauceConnect
##D # ./sc-4.3.16-linux/bin/sc -u seleniumPipes -k ##########-####-####-####-#######
##D # we start one
##D myTunnels <- getTunnels(myAcc)
##D #> myTunnels
##D #[[1]]
##D #[1] "cbfb1981c9dd45d1a1ecb9dc47de5ba4"
##D tunnelInfo <- getTunnel(myAcc, tunnelID = myTunnels[[1]])
##D #> tunnelInfo[c("status", "host", "owner", "id")]
##D #$status
##D #[1] "running"
##D #
##D #$host
##D #[1] "maki81013.miso.saucelabs.com"
##D #
##D #$owner
##D #[1] "seleniumPipes"
##D #
##D #$id
##D #[1] "cbfb1981c9dd45d1a1ecb9dc47de5ba4"
##D res <- deleteTunnel(myAcc, tunnelID = myTunnels[[1]])
##D #> res
##D #$jobs_running
##D #[1] 0
##D #
##D #$result
##D #[1] TRUE
##D #
##D #$id
##D #[1] "cbfb1981c9dd45d1a1ecb9dc47de5ba4"
##D 
##D #> getTunnels(myAcc)
##D #list()
##D 
## End(Not run)



