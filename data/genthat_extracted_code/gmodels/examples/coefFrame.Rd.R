library(gmodels)


### Name: coefFrame
### Title: Return model parameters in a data frame
### Aliases: coefFrame
### Keywords: models

### ** Examples

# load example data
library(gtools)
data(ELISA)

# Coefficients for four parameter logistic fits:
coefFrame(log(Signal) ~ SSfpl(log(Concentration), A, B, xmid, scal),
           data = ELISA, fitfun = nls,
           by = c("PlateDay", "Read"),
           fit.on = Description == "Standard" & Concentration != 0)

# Coefficients for linear fits:
coefFrame(log(Signal) ~ log(Concentration), 
           data = ELISA, fitfun = lm, 
           by = c("PlateDay", "Read"),
           fit.on = Description == "Standard" & Concentration != 0 )

# Example passing arguments to fitfun, and example of
# error handling during model fitting:
ELISA$Signal[1] <- NA
coefFrame(log(Signal) ~ log(Concentration), 
           data = ELISA, fitfun = lm, na.action = na.fail,
           by = c("PlateDay", "Read"),
           fit.on = Description == "Standard" & Concentration != 0 )





