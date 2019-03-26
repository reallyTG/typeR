library(fuzzySim)


### Name: fuzzyRangeChange
### Title: Range change based on continuous (fuzzy) values
### Aliases: fuzzyRangeChange

### ** Examples

# get an environmental favourability model for a rotifer species:

data(rotif.env)

names(rotif.env)

fav_current <- multGLM(rotif.env, sp.cols = 18, var.cols = 5:17, 
step = TRUE, FDR = TRUE, trim = TRUE, P = FALSE, Fav = TRUE) $
predictions


# imagine you have a model prediction for this species in a future time
# (here we will create one by randomly jittering the current predictions)

fav_imag <- jitter(fav_current, amount = 0.2)
fav_imag[fav_imag < 0] <- 0
fav_imag[fav_imag > 1] <- 1


# calculate range change given by current and imaginary future predictions:

fuzzyRangeChange(fav_current, fav_imag)

fuzzyRangeChange(fav_current, fav_imag, number = FALSE)

fuzzyRangeChange(fav_current, fav_imag, ylim = c(-1, 1), 
ylab = "Proportional change")



