library(parfm)


### Name: asthma
### Title: Recurrent asthma attacks in children
### Aliases: asthma
### Keywords: datasets asthma frailty

### ** Examples

## No test: 
data(asthma)
head(asthma)
asthma <- asthma[asthma$Fevent==0,]

################################################################################
# Example 2.4: The frailty model with the Weibull baseline for the recurrent   #
# asthma data based on marginal likelihood maximisation                        #
# Duchateau and Janssen (2008, page 56)                                        #
################################################################################
# Calendar time
parfm(Surv(Begin, End, Status) ~ Drug, cluster = "Patid", data = asthma,
      dist = "weibull", frailty = "gamma")

# Gap time
asthma$time <- asthma$End - asthma$Begin
parfm(Surv(time, Status) ~ Drug, cluster = "Patid", data = asthma,
      dist = "weibull", frailty = "gamma")
## End(No test)



