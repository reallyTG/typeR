library(genlogis)


### Name: genlog_mle_sk
### Title: Optimization for a generalized logistic distribution with
###   skewness
### Aliases: genlog_mle_sk
### Keywords: genlogis

### ** Examples


## Using generic parameter starting values
datas <- rgenlog_sk(10000, 0.3,0.9,1.5, 0, 0.9)
genlog_mle_sk(c(0.3,0.9,1.5, 0, 0.9),datas)

## Select parameters starting values with genlog_slider
## No test: 
datas <- rgenlog(10000, 1.5,2,2, 0)
genlog_slider(datas, return_var = 'parameters', skew = T) ## choose parameters
genlog_mle_sk(parameters,datas)
## End(No test)




