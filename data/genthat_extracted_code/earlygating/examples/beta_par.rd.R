library(earlygating)


### Name: beta_par
### Title: Parameters of Beta distribution given Historical Data
### Aliases: beta_par

### ** Examples

mu_cov <- c("date", "Phase")
orr <- "ORR"
newdata <- data.frame("date" = 2017, "Phase" = factor(3))
studs <- data.frame("ORR"= c(0.693, 0.580, 0.693, 0.477, 0.609,
                             0.727, 0.727, 0.591, 0.362, 0.593,
                             0.792, 0.620, 0.550, 0.690, 0.776),
                    "date" = c( 2011, 2008.5, 2009, 1996, 2001,
                                2003.5, 2002.5, 2008, 2000,
                                2006, 2005, 2007.5, 2009.5,
                                2010.5, 2010),
                    "Phase" = factor(c(3, 2, 3, 3, 2, 2, 3, 3, 3, 3,
                                2, 3, 3, 3, 2)),
                    "N" = c(293, 69, 336, 235, 92, 110, 131, 208, 94,
                            123, 53, 182, 267, 239, 237))

beta_par(mu_cov=mu_cov, orr=orr, data=studs, newdata=newdata,
weights = studs$N/mean(studs$N))



