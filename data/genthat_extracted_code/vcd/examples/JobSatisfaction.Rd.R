library(vcd)


### Name: JobSatisfaction
### Title: Job Satisfaction Data
### Aliases: JobSatisfaction
### Keywords: datasets

### ** Examples

data("JobSatisfaction")
structable(~ ., data = JobSatisfaction)

mantelhaen.test(xtabs(Freq ~ own + supervisor + management,
                      data = JobSatisfaction))




