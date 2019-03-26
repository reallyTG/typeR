library(geiger)


### Name: medusa
### Title: MEDUSA: modeling evolutionary diversification using stepwise AIC
### Aliases: medusa print.medusa
### Keywords: models

### ** Examples

    ## No test: 
    dat=get(data(whales))
    phy=dat$phy
    richness=dat$richness
    
    ## USING AICc as STOPPING CRITERION
    res1=medusa(phy, richness, warnings=FALSE)
    print(names(res1)) # output list elements
    print(res1$summary) # show 'summary' object
    summary(res1, criterion="aicc") # select best model based on AICc
    
    ## PLOTTING RESULTS
    # plot breakpoints for the best model chosen by AICc
    # invoking plot.medusa()
    plot(res1, cex=0.5,label.offset=1, edge.width=2) 
    
## End(No test)



