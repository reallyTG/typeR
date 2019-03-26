library(rDEA)


### Name: rts.test
### Title: Test for returns-to-scale in data envelopment analysis
### Aliases: rts.test
### Keywords: DEA, non-parametric efficiency, technical efficiency, cost
###   efficiency

### ** Examples

## load data on Japanese hospitals (Besstremyannaya 2013, 2011)
data("hospitals", package="rDEA")
firms = 1:50
Y = hospitals[firms, c('inpatients', 'outpatients')]
X = hospitals[firms, c('labor', 'capital')]

## Returns-to-scale test in the input-oriented DEA model,
## Testing the null hypothesis of constant returns-to-scale
## vs. an alternative of variable returns-to-scale
rts_input=rts.test(X=X, Y=Y, W=NULL, model="input", H0="constant",
                bw="cv", B=100, alpha=0.05)

rts_input$pvalue
rts_input$H0reject
rts_input$H0level


## Test for cost-efficiency DEA model,
## Testing the null hypothesis of constant returns-to-scale
## vs. an alternative of variable returns-to-scale
W = hospitals[firms, c('labor_price', 'capital_price')]

rts_cost = rts.test(X=X, Y=Y, W=W, model="costmin", H0="constant",
                    bw="cv", B=100, alpha=0.05)

rts_cost$pvalue
rts_cost$H0reject
rts_cost$H0level



