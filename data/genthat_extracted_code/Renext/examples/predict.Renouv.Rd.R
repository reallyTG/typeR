library(Renext)


### Name: predict.Renouv
### Title: Compute return levels and confidence limits for a "Renouv"
###   object
### Aliases: predict.Renouv

### ** Examples

## Use Brest data
fit <- Renouv(Brest)
pred <- predict(fit, newdata = c(100, 125, 150, 175, 200),
                level = c(0.99, 0.95))



