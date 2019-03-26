library(hdnom)


### Name: hdnom.compare.validate
### Title: Compare High-Dimensional Cox Models by Model Validation
### Aliases: hdnom.compare.validate

### ** Examples

# Load imputed SMART data
data(smart)
x = as.matrix(smart[, -c(1, 2)])[1:1000, ]
time = smart$TEVENT[1:1000]
event = smart$EVENT[1:1000]

# Compare lasso and adaptive lasso by 5-fold cross-validation
cmp.val.cv = hdnom.compare.validate(
  x, time, event, model.type = c("lasso", "alasso"),
  method = "cv", nfolds = 5, tauc.type = "UNO",
  tauc.time = seq(0.25, 2, 0.25) * 365, seed = 1001)

print(cmp.val.cv)
summary(cmp.val.cv)
plot(cmp.val.cv)
plot(cmp.val.cv, interval = TRUE)



