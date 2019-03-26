library(samon)


### Name: alpha0Tables
### Title: Makes samon result tables at alpha = 0
### Aliases: alpha0Tables alpha0TableResults

### ** Examples

data("samonPANSS1")
data("samonPANSS2")

data("PSummary1")
data("PSummary2")
data("PSummaryD")

alpha0Results <- alpha0TableResults( samonPANSS1, PSummary1,
                                     samonPANSS2, PSummary2,
                                                  PSummaryD )
alpha0Tables(alpha0Results)



