library(PRISM.forecast)


### Name: back_test
### Title: Out-of-sample prediction for whole period
### Aliases: back_test

### ** Examples

claim_data = load_claim_data()

## No test: 
# It may take a few minutes.
## End(No test)
## No test: 
prism_prediction = back_test()
## End(No test)
## No test: 
# evaluate the out-of-sample prediction error as a ratio to naive method
## End(No test)
## No test: 
evaluation_table(claim_data, prism_prediction)
## End(No test)




