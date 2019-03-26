library(papeR)


### Name: labels
### Title: Extract labels from and set labels for data frames
### Aliases: labels labels.default labels.data.frame labels<- as.ldf is.ldf
###   convert.labels plot plot.ldf
### Keywords: methods

### ** Examples

############################################################
### Basic labels manipulations

data <- data.frame(a = 1:10, b = 10:1, c = rep(1:2, 5))
labels(data)  ## only the variable names
is.ldf(data) ## not yet

## now set labels
labels(data) <- c("my_a", "my_b", "my_c")
## one gets a named character vector of labels
labels(data)
## data is now a ldf:
is.ldf(data)

## Altervatively one could use as.ldf(data) or convert.labels(data);
## This would keep the default labels but set the class
## correctly.

## set labels for a and b only
## Note that which represents the variable names!
labels(data, which = c("a", "b")) <- c("x", "y")
labels(data)

## reset labels (to variable names):
labels(data) <- NULL
labels(data)

## set label for a only and use default for other labels:
labels(data, which = "a") <- "x"
labels(data)

## attach label for new variable:
data2 <- data
data2$z <- as.factor(rep(2:3, each = 5))
labels(data2)  ## no real label for z, only variable name
labels(data2, which = "z") <- "new_label"
labels(data2)


############################################################
### Abbreviate labels

## attach long labels to data
labels(data) <- c("This is a long label", "This is another long label",
                  "This also")
labels(data)
labels(data, abbreviate = TRUE, minlength = 10)


############################################################
### Data manipulations

## reorder dataset:
tmp <- data2[, c(1, 4, 3, 2)]
labels(tmp)
## labels are kept and order is updated

## subsetting to single variables:
labels(tmp[, 2])  ## not working as tmp[, 2] drops to vector
## note that the label still exists but cannot be extracted
## using labels.default()
str(tmp[, 2])

labels(tmp[, 2, drop = FALSE]) ## prevent dropping

## one can also cbind labeled data.frame objects:
labels(cbind(data, tmp[, 2]))
## or better:
labels(cbind(data, tmp[, 2, drop = FALSE]))
## or rbind labeled.data.set objects:
labels(rbind(data, tmp[, -2]))


############################################################
### Plotting data sets

## plot the data auto"magically"; numerics as boxplot, factors as barplots
par(mfrow = c(2,2))
plot(data2)

## a single plot
plot(data2, variables = "a")
## grouped plot
plot(data2, variables = "a", by = "z")
## make "c" a factor and plot "c" vs. "z"
data2$c <- as.factor(data2$c)
plot(data2, variables = "c", by = "z")
## the same
plot(data2, variables = 3, by = 4)

## plot everithing against "b"
## (grouped boxplots, stacked barplots or scatterplots)
plot(data2, with = "b")



