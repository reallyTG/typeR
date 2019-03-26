library(CAvariants)


### Name: summary.CAvariants
### Title: Summary of numerical results from CA variants
### Aliases: summary.CAvariants
### Keywords: summary

### ** Examples

asbestos <- matrix(c(310, 36, 0, 0, 212, 158, 9, 0, 21, 35, 17, 4, 25, 102,  
49, 18, 7, 35, 51, 28), 4, 5, dimnames = list(c("none","grade1", "grade2", "grade3"), 
c("0-9", "10-19", "20-29", "30-39", "40")))
risasbestos <- CAvariants(asbestos, catype = "DOCA", firstaxis = 1, lastaxis = 2) 
summary(risasbestos)



