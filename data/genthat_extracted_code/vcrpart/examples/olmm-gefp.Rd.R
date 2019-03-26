library(vcrpart)


### Name: olmm-gefp
### Title: Methods for score processes of 'olmm' objects
### Aliases: olmm-gefp gefp.olmm predecor_control estfun.olmm
### Keywords: methods

### ** Examples

## ------------------------------------------------------------------- #
## Dummy example :
##
## Testing coefficient constancy on 'z4' of the 'vcrpart_1' data.
## ------------------------------------------------------------------- #

data(vcrpart_1)

## extract a unbalanced subset to show to the full functionality of estfun
vcrpart_1 <- vcrpart_1[-seq(1, 100, 4),]
subset <- vcrpart_1$wave != 1L ## obs. to keep for fluctuation tests
table(table(vcrpart_1$id))

## fit the model
model <- olmm(y ~ treat + re(1|id), data = vcrpart_1)

## extract and pre-decorrelate the scores
scores <- estfun.olmm(model, predecor = TRUE,
                      control = predecor_control(verbose = TRUE))
attr(scores, "T") # transformation matrix

## compute the empirical fluctuation process
fp <- gefp.olmm(model, scores, order.by = vcrpart_1$z4)

## process a fluctuation test
library(strucchange)
sctest(fp, functional = catL2BB(fp))



