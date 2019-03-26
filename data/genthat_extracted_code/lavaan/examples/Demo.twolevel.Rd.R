library(lavaan)


### Name: Demo.twolevel
### Title: Demo dataset for a illustrating a multilevel CFA.
### Aliases: Demo.twolevel

### ** Examples

head(Demo.twolevel)

model <- '
    level: 1
        fw =~ y1 + y2 + y3
        fw ~ x1 + x2 + x3
    level: 2
        fb =~ y1 + y2 + y3
        fb ~ w1 + w2
'
fit <- sem(model, data = Demo.twolevel, cluster = "cluster")
summary(fit)



