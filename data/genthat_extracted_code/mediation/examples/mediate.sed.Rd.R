library(mediation)


### Name: mediate.sed
### Title: Estimating Average Causal Mediation Effects under the Single
###   Experiment Design
### Aliases: mediate.sed

### ** Examples


# Example 1: Bounds without SI assumption

data(boundsdata)

data.SED <- subset(boundsdata, manip == 0)
bound1 <- mediate.sed("out", "med", "ttt", data.SED, SI=FALSE)
summary(bound1)

# Example 2: Nonparametric estimate of ACME under SI assumption
# Example with JOBS II Field Experiment

data(jobs)

foo.1 <- mediate.sed("depress2", "job_disc", "treat", jobs, SI=TRUE)
summary(foo.1)

foo.2 <- mediate.sed("depress2", "job_disc", "treat", jobs, SI=TRUE, boot=TRUE)
summary(foo.2)




