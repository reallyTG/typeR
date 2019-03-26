library(SingleCaseES)


### Name: batch_calc_ES
### Title: Calculate effect sizes from a dataset for multiple series
### Aliases: batch_calc_ES

### ** Examples


data(McKissick)
batch_calc_ES(McKissick,
              grouping = Case_pseudonym,
              condition = Condition,
              outcome = Outcome,
              ES = c("LRRd","LRRi"),
              improvement = "decrease",
              scale = "count",
              observation_length = 20,
              format = "long")
              
data(Schmidt2007)               
batch_calc_ES(dat = Schmidt2007,
              grouping = c(Behavior_type, Case_pseudonym, Phase_num),
              condition = Condition,
              outcome = Outcome,
              ES = c("LRRi","LRRd"),
              improvement = direction,
              scale = Metric,
              bias_correct = TRUE,
              confidence = NULL,
              format = "wide")




