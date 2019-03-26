library(SpATS)


### Name: predict.SpATS
### Title: Predictions from an 'SpATS' object
### Aliases: predict.SpATS

### ** Examples

library(SpATS)
data(wheatdata)
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

m0 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20)), 
 genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, 
 data = wheatdata, control =  list(tolerance = 1e-03))

# Fitted values: prediction on the dataset used for fitting the model
pred1.m0 <- predict(m0, newdata = wheatdata)
pred1.m0[1:5,]

# Genotype prediction
pred2.m0 <- predict(m0, which = "geno")
pred2.m0[1:5,]




