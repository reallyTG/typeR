library(antitrust)


### Name: cmcr.cournot
### Title: Compensating Marginal Cost Reductions and Upwards Pricing
###   Pressure (Cournot)
### Aliases: cmcr.cournot upp.cournot

### ** Examples


    shares=c(.05,.65)
    industryElast = 1.9


    cmcr.cournot(shares,industryElast)


     ## Calculate the necessary percentage cost reductions for various shares and
     ##  industry elasticities in a two-product merger where both firm
     ##  products have identical share (see Froeb and
     ##  Werden, 1998, pg. 369, Table 1)



    deltaHHI = c(100, 500, 1000, 2500, 5000) #start with change in HHI
    shares = sqrt(deltaHHI/(2*100^2)) #recover shares from change in HHI
    industryElast = 1:3

    result = matrix(nrow=length(deltaHHI),ncol=length(industryElast),
                    dimnames=list(deltaHHI,industryElast))

    for(s in 1:length(shares)){
        for(e in 1:length(industryElast)){


           result[s,e] = cmcr.cournot(rep(shares[s],2),industryElast[e])[1]

    }}

    print(round(result,1))



