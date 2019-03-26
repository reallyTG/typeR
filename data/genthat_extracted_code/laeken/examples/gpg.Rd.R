library(laeken)


### Name: gpg
### Title: Gender pay (wage) gap.
### Aliases: gpg
### Keywords: survey

### ** Examples

data(ses)

# overall value with mean
gpg("earningsHour", gender = "sex", weigths = "weights",
    data = ses)

# overall value with median
gpg("earningsHour", gender = "sex", weigths = "weights",
    data = ses, method = "median")

# values by education with mean
gpg("earningsHour", gender = "sex", weigths = "weights",
    breakdown = "education", data = ses)

# values by education with median
gpg("earningsHour", gender = "sex", weigths = "weights",
    breakdown = "education", data = ses, method = "median")



