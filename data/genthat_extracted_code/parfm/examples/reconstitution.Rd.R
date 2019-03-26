library(parfm)


### Name: reconstitution
### Title: Reconstitution of blood-milk barrier after reconstitution
### Aliases: reconstitution
### Keywords: datasets reconstitution reconstitution cows infection udder
###   frailty

### ** Examples

data(reconstitution)
head(reconstitution)
                

################################################################################
# Example 3.1: The [...] frailty model for the time to blood-milk barrier      #
# reconstitution: the effect of treatment                                      #
# Duchateau and Janssen (2008, page 79)                                        #
################################################################################
pfmDrug <- parfm(Surv(Time, Status) ~ Drug,
                 cluster = "Cowid", dist = "exponential",
                 frailty = "gamma", data = reconstitution)
ci.parfm(pfmDrug)
                

################################################################################
# Example 3.2: The [...] frailty model for the time to blood-milk barrier      #
# reconstitution: the heifer effect                                            #
# Duchateau and Janssen (2008, page 82)                                        #
################################################################################
pfmHeifer <- parfm(Surv(Time, Status) ~ Heifer,
                   cluster = "Cowid", dist = "exponential",
                   frailty = "gamma", data = reconstitution)
ci.parfm(pfmHeifer)



