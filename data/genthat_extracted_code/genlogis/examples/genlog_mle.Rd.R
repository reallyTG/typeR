library(genlogis)


### Name: genlog_mle
### Title: Optimization for a generalized logistic distribution
### Aliases: genlog_mle
### Keywords: genlogis

### ** Examples


## Using generic parameter starting values
datas <- rgenlog(10000, 1.5,2,2, 0)
genlog_mle(c(.5,1.6, 1.5, 0),datas)

## Select parameters starting values with genlog_slider
## No test: 
datas <- rgenlog(10000, 1.5,2,2, 0)
genlog_slider(datas, return_var = 'parameters') ## choose parameters
genlog_mle(parameters,datas)
## End(No test)




