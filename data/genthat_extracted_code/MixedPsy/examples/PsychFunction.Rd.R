library(MixedPsy)


### Name: PsychFunction
### Title: Fitting and Plotting Psychometric Functions
### Aliases: PsychFunction
### Keywords: DeltaMethod GLM Plotting Psychometric

### ** Examples

# simulate data from a single participant
datafr.S1 <- PsySimulate(fixeff = c(-7.5, 0.0875), nsubject = 1, constant = TRUE)
#fit a glm (probit link)
model.glm = glm(formula = cbind(Longer, Total - Longer) ~ X,
family = binomial(link = "probit"), data = datafr.S1)

#fit psychometric function single-subject data and draw on existing plot
plot(Longer/Total ~ X, data = datafr.S1)
fit.S1 = PsychFunction(ps.formula = cbind(Longer, Total - Longer) ~ X,
                        ps.link = "probit", ps.data = datafr.S1,
                        x.range = c(40, 120), ps.lines = TRUE)
                        



