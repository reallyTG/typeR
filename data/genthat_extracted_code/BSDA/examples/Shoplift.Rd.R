library(BSDA)


### Name: Shoplift
### Title: Sales receipts versus shoplifting losses for a department store
### Aliases: Shoplift
### Keywords: datasets

### ** Examples


plot(loss ~ sales, data = Shoplift)
model <- lm(loss ~ sales, data = Shoplift)
summary(model)
rm(model)




