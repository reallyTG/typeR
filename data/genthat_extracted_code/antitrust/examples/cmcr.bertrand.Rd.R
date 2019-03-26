library(antitrust)


### Name: cmcr.bertrand
### Title: Compensating Marginal Cost Reductions and Upwards Pricing
###   Pressure (Bertrand)
### Aliases: cmcr.bertrand upp.bertrand upp cmcr

### ** Examples


     ## Let k_1 = 1 and and k_2 = 2 ##

    p1 = 50;      margin1 = .3
    p2 = c(45,70); margin2 = c(.4,.6)
    isOne=c(1,0,0)
    diversions = matrix(c(-1,.5,.01,.6,-1,.1,.02,.2,-1),ncol=3)

    cmcr.bertrand(c(p1,p2), c(margin1,margin2), diversions, isOne)
     upp.bertrand(c(p1,p2), c(margin1,margin2), diversions, isOne)


     ## Calculate the necessary percentage cost reductions for various margins and
     ## diversion ratios in a two-product merger where both products have
     ## equal prices and diversions (see Werden 1996, pg. 412, Table 1)


    margins = seq(.4,.7,.1)
    diversions = seq(.05,.25,.05)
    prices = rep(1,2) #assuming prices are equal, we can set product prices to 1
    isOne = c(1,0)
    result = matrix(ncol=length(margins),nrow=length(diversions),dimnames=list(diversions,margins))

    for(m in 1:length(margins)){
        for(d in 1:length(diversions)){

           dMatrix = -diag(2)
           dMatrix[2,1] <- dMatrix[1,2] <- diversions[d]

           firmMargins = rep(margins[m],2)

           result[d,m] = cmcr.bertrand(prices, firmMargins, dMatrix, isOne)[1]

    }}

    print(round(result,1))



