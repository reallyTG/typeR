library(diagmeta)


### Name: ipd2diag
### Title: Individual participant data to enter them into diagmeta
### Aliases: ipd2diag

### ** Examples


# Simulate IPD data for three studies, each with 30 patients based
# on normally distributed marker values
#
k <- 3
n <- 30
m <- c(20, 23, 26)
d <- 10
s <- 5
studlab <- c(rep(1, n), rep(2, n), rep(3, n))
status <- rep(c(rep(0, n / 2), rep(1, n / 2)), k)
measurement <- c(rnorm(n / 2, m[1], s), rnorm(n/2, m[1] + d, s),
                 rnorm(n / 2, m[2], s), rnorm(n/2, m[2] + d, s), 
                 rnorm(n / 2, m[3], s), rnorm(n/2, m[3] + d, s))
#
IPDdata <- data.frame(studlab, measurement, status)
str(IPDdata)

# Transform these data using ipd2diag()
#
diagdata <- ipd2diag(studlab, value = measurement, status = status)
str(diagdata)

# Run diagmeta()
#
diag1 <- diagmeta(TP, FP, TN, FN, cutoff, studlab,
                  data = diagdata, 
                  model = "DIDS", distr = "normal")
summary(diag1)
plot(diag1)
par(mfrow = c(1, 2))
plot(diag1, which = "ROC", lines = TRUE)
plot(diag1, which = "SROC", ciSens = TRUE,
     ciSpec = TRUE, lines = TRUE, shading = "hatch")




