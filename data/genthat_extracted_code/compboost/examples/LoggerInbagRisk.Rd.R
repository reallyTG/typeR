library(compboost)


### Name: LoggerInbagRisk
### Title: Logger class to log the inbag risk
### Aliases: LoggerInbagRisk

### ** Examples

# Used loss:
log.bin = LossBinomial$new()

# Define logger:
log.inbag.risk = LoggerInbagRisk$new(FALSE, log.bin, 0.05)

# Summarize logger:
log.inbag.risk$summarizeLogger()




