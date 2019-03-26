library(EMMAgeo)


### Name: robust.EM
### Title: Function to extract robust end-members.
### Aliases: robust.EM
### Keywords: EMMA

### ** Examples

## load example data, i.e. here TR
data(TR, envir = environment())

## define end-member limits
limits = cbind(c(11, 31, 60, 78),
               c(13, 33, 62, 80))

## extract robust end-members with limits matrix
rEM <- robust.EM(Vqsn = TR$Vqsn, limits = limits,
                 plot = TRUE,
                 legend = "topleft",
                 cex = 0.7,
                 colour = c("orange", "navyblue", "springgreen4", "red4"),
                 median = TRUE)



