library(neuralnet)


### Name: confidence.interval
### Title: Calculates confidence intervals of the weights
### Aliases: confidence.interval
### Keywords: neural

### ** Examples


    data(infert, package="datasets")
    print(net.infert <- neuralnet(case~parity+induced+spontaneous,  
                        infert, err.fct="ce", linear.output=FALSE))
    confidence.interval(net.infert)




