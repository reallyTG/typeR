library(Mediana)


### Name: Event
### Title: Event object
### Aliases: Event

### ** Examples

# In this case study, the radomization ratio is 2:1 (Treatment:Placebo).

# Sample size parameters
event.count.total = c(390, 420)
randomization.ratio = c(1,2)

# Outcome parameters
median.time.placebo = 6
rate.placebo = log(2)/median.time.placebo
outcome.placebo = list(rate = rate.placebo)
median.time.treatment = 9
rate.treatment = log(2)/median.time.treatment
outcome.treatment = list(rate = rate.treatment)

# Dropout parameters
dropout.par = parameters(rate = 0.0115)

# Data model
data.model = DataModel() +
             OutcomeDist(outcome.dist = "ExpoDist") +
             Event(n.events = event.count.total, rando.ratio = randomization.ratio) +
             Design(enroll.period = 9,
                    study.duration = 21,
                    enroll.dist = "UniformDist",
                    dropout.dist = "ExpoDist",
                    dropout.dist.par = dropout.par) +
             Sample(id = "Placebo",
                    outcome.par = parameters(outcome.placebo)) +
             Sample(id = "Treatment",
                    outcome.par = parameters(outcome.treatment))



