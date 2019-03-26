library(samon)


### Name: alpha0TablesIM
### Title: Makes samonIM result tables at sensitivity parameter alpha = 0.
### Aliases: alpha0TablesIM alpha0TableResultsIM

### ** Examples

data("VAS1")
data("VAS2")

data("VSummary1")
data("VSummary2")
data("VSummaryD")

alpha0Results <- alpha0TableResultsIM( VAS1, VSummary1,
                                       VAS2, VSummary2,
                                             VSummaryD )
alpha0TablesIM(alpha0Results)



