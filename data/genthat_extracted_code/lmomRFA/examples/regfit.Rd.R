library(lmomRFA)


### Name: regfit
### Title: Fit a regional frequency distribution
### Aliases: regfit rfd print.rfd
### Keywords: misc

### ** Examples

data(Cascades)                  # An object of class "regdata"
rfit <- regfit(Cascades, "gno") # Fit a generalized normal distribution
rfit                            # Print details of the fitted distribution
                                #   (components 'dist' and 'para')
rfit$index                      # Index flood values

evplot(rfit)                    # Plot the regional growth curve
evplot(qfunc=rfit$qfunc)        # The same, but with more typing
evplot(qfunc=regqfunc(rfit))    # The same, with still more typing



