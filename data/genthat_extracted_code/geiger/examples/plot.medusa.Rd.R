library(geiger)


### Name: plot.medusa
### Title: MEDUSA: modeling evolutionary diversification using stepwise AIC
### Aliases: plot.medusa
### Keywords: graphics

### ** Examples

    ## No test: 
    dat=get(data(whales))
    phy=dat$phy
    richness=dat$richness
        
    res <- medusa(phy, richness)
    
    # select best model based on AICc (showing the third model as best)
    plot(res, cex=0.5, label.offset=1) # using plot.medusa()
    title("AICc-chosen model")
    
## End(No test)



