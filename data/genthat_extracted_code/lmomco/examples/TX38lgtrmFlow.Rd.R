library(lmomco)


### Name: TX38lgtrmFlow
### Title: First six L-moments of logarithms of annual mean streamflow and
###   variances for 35 selected long-term U.S. Geological Survey
###   streamflow-gaging stations in Texas
### Aliases: TX38lgtrmFlow
### Keywords: datasets

### ** Examples

data(TX38lgtrmFlow)
summary(TX38lgtrmFlow)
## Not run: 
##D # Need to load libraries in this order
##D library(lmomco); library(lmomRFA)
##D data(TX38lgtrmFlow)
##D TxDat <- TX38lgtrmFlow
##D TxDat <- TxDat[,-c(4)]; TxDat <- TxDat[,-c(8:15)]
##D summary(regtst(TxDat))
##D TxDat2 <- TxDat[-c(11, 28),] # Remove 08082700 Millers Creek near Munday
##D                              # Remove 08190500 West Nueces River at Brackettville
##D # No explanation for why Millers Creek is so radically discordant with the other
##D # streamgages with the possible exception that its data record does not span the
##D # drought of the 1950s like many of the other streamgages.
##D # The West Nueces is a highly different river from even nearby streamgages. It
##D # is a problem in flood frequency analysis too. So not surprizing to see this
##D # streamgage come up as discordant.
##D summary(regtst(TxDat2))
##D S <- summary(regtst(TxDat2))
##D # The results suggest that none of the 3-parameter distributions are suitable.
##D # The bail out solution using the Wakeby distribution is accepted. Our example
##D # will continue on by consideration of the two 4-parameter distributions
##D # available. A graphical comparison between three frequency curves will be made.
##D kap <- S$rpara
##D rmom <- S$rmom
##D lmr <- vec2lmom(rmom, lscale=FALSE)
##D aep <- paraep4(lmr)
##D F <- as.numeric(unlist(attributes(S$quant)$dimnames[2]))
##D plot(qnorm(F), S$quant[6,], type="l", lwd=3, lty=2,
##D      xlab="Nonexceedance probability (as standard normal variate)",
##D      ylab="Frequency factor (dimensionless)")
##D lines(qnorm(F), quakap(F, kap), col=4, lwd=2)
##D lines(qnorm(F), quaaep4(F, aep), col=2)
##D legend(-1, 0.8, c("Wakeby distribution (5 parameters)",
##D                   "Kappa distribution (4 parameters)",
##D                   "Asymmetrical Exponential Power distribution (4 parameters)"),
##D        bty = "n", cex=0.75, lwd=c(3,2,1), lty=c(2,1,1), col=c(1,4,2)
##D       )
##D # Based on general left tail behavior the Wakeby distribution is not acceptable.
##D # Based on general right tail behavior the AEP is preferred.
##D #
##D # It is recognized that the regional analysis provided by regtst() indicates
##D # substantial heterogeneity by all three definitions of that statistic. Further
##D # analysis to somehow compensate for climatological and general physiographic
##D # differences between the watersheds might be able to compensate for the
##D # heterogeneity. Such an effort is outside scope of this example.
##D #
##D # Suppose that the following data set is available for particular stream site from
##D # a short record streamgage, let us apply the dimensionless frequency curve as
##D # defined by the asymmetric exponential power distribution. Lettuce also use the
##D # 50-year drought as an example. This recurrence interval has a nonexceedance
##D # probability of 0.02. Lastly, there is the potential with this particular process
##D # to compute a negative annual mean streamflow, when this happens truncate to zero.
##D data <- c(11.9, 42.8, 36, 20.4, 43.8, 30.7, 91.1, 54.7, 43.7, 17, 28.7, 20.5, 81.2)
##D xbar <- mean(log10(data + 10)) # shift, log, and mean
##D # Note the application of the "the index method" within the exponentiation.
##D tmp.quantile <- 10^(xbar*quaaep4(0.02, aep)) - 10 # detrans, offset
##D Q50yeardrought <- ifelse(tmp.quantile < 0, 0, tmp.quantile)
##D # The value is 2.53 cubic feet per second average streamflow.
## End(Not run)



