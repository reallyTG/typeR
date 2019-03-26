library(npsurv)


### Name: leukemia
### Title: Remission Times for Acute Leukemia Patients
### Aliases: leukemia
### Keywords: datasets

### ** Examples

data(leukemia)
i = leukemia[,"group"] == "Placebo"
plot(npsurv(leukemia[i,1:2]), xlim=c(0,40), col="green3") # placebo
plot(npsurv(leukemia[!i,1:2]), add=TRUE)                  # 6-MP

## Treat each remission time as interval-censored:
x = leukemia
ii = x[,1] == x[,2]
x[ii,2] = x[ii,1] + 1
plot(npsurv(x[i,1:2]), xlim=c(0,40), col="green3")        # placebo
plot(npsurv(x[!i,1:2]), add=TRUE)                         # 6-MP



