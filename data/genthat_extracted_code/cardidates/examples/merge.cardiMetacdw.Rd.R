library(cardidates)


### Name: merge.cardiMetacdw
### Title: Merge Two Objects of Class 'cardiMetacdw'
### Aliases: merge.cardiMetacdw
### Keywords: misc

### ** Examples

## artificial test data
data(carditest)

## identify all first peaks
fit <- metaCDW(carditest)

## plot it
plot(fit, carditest)

## detect second peak for 'Year2'
sample2 <- subset(carditest, sample == "Year 2")
sample2$sample <- factor(sample2$sample) # drop unused levels
fit2 <- metaCDW(sample2, xstart=150)

## merge results
merged.fit <- merge(fit, fit2)
plot(merged.fit, carditest)



