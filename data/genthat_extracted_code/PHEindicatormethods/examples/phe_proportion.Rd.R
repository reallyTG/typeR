library(PHEindicatormethods)


### Name: phe_proportion
### Title: phe_proportion
### Aliases: phe_proportion

### ** Examples

df <- data.frame(area = c("Area1","Area2","Area3"),
                 numerator = c(65,82,100),
                 denominator = c(100,100,100))

phe_proportion(df, numerator, denominator)
phe_proportion(df, numerator, denominator, confidence=99.8)
phe_proportion(df, numerator, denominator, type="full")




