library(compboost)


### Name: LoggerOobRisk
### Title: Logger class to log the out of bag risk
### Aliases: LoggerOobRisk

### ** Examples

# Define data:
X1 = cbind(1:10)
X2 = cbind(10:1)
data.source1 = InMemoryData$new(X1, "x1")
data.source2 = InMemoryData$new(X2, "x2")

oob.list = list(data.source1, data.source2)

set.seed(123)
y.oob = rnorm(10)

# Used loss:
log.bin = LossBinomial$new()

# Define logger:
log.oob.risk = LoggerOobRisk$new(FALSE, log.bin, 0.05, oob.list, y.oob)

# Summarize logger:
log.oob.risk$summarizeLogger()




