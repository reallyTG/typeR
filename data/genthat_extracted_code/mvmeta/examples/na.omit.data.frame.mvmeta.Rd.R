library(mvmeta)


### Name: na.omit.data.frame.mvmeta
### Title: Handling Missing Values in mvmeta Models
### Aliases: na.omit.data.frame.mvmeta na.exclude.data.frame.mvmeta
### Keywords: models regression multivariate methods manip

### ** Examples

# INPUT MISSING VALUES IN PREDICTOR AND ONE RESPONSE
data <- berkey98
data[2,1] <- data[4,3] <- NA
data

# RUN THE MODEL
model <- mvmeta(cbind(PD,AL)~pubyear,S=data[5:7],data=data,method="ml")

# SUMMARIZE: NOTE THE NUMBER OF STUDIES AND OBSERVATIONS
summary(model)
df.residual(model)

# EXTRACT THE MODEL FRAME WITH na.pass
model.frame(model,na.action="na.pass")
# EXTRACT THE MODEL FRAME WITH na.omit (DEFAULT)
model.frame(model,na.action="na.omit")

# COMPARE WITH DEFAULT METHOD FOR na.omit
frame <- model.frame(model,na.action="na.pass")
na.omit(frame)
class(frame)
class(frame) <- "data.frame"
na.omit(frame)

# WITH na.exclude
residuals(model)
residuals(update(model,na.action="na.exclude"))



