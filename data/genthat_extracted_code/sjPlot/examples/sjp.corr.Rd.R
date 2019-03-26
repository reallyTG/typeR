library(sjPlot)


### Name: sjp.corr
### Title: Plot correlation matrix
### Aliases: sjp.corr

### ** Examples

# create data frame with 5 random variables
mydf <- data.frame(cbind(runif(10), runif(10), runif(10),
                         runif(10), runif(10)))

# plot correlation matrix
sjp.corr(mydf)

# -------------------------------
# Data from the EUROFAMCARE sample dataset
# -------------------------------
library(sjlabelled)
data(efc)

# retrieve variable and value labels
varlabs <- get_label(efc)

# create data frame
vars.index <- c(1, 4, 15, 19, 20, 21, 22, 24, 25)
mydf <- data.frame(efc[, vars.index])
colnames(mydf) <- varlabs[vars.index]

# show legend
sjp.corr(mydf, show.legend = TRUE)

# -------------------------------
# auto-detection of labels
# -------------------------------
sjp.corr(efc[, vars.index])





