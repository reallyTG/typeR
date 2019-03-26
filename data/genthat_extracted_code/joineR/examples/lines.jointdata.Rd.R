library(joineR)


### Name: lines.jointdata
### Title: Add lines to an existing 'jointdata' plot
### Aliases: lines.jointdata
### Keywords: aplot

### ** Examples

data(heart.valve)
heart.surv <- UniqueVariables(heart.valve, 
                              var.col = c("fuyrs", "status"), 
                              id.col = "num")
heart.long <- heart.valve[, c(1, 4, 5, 7, 8, 9, 10, 11)]
heart.jd <- jointdata(longitudinal = heart.long, 
                      survival = heart.surv,
                      id.col = "num",
                      time.col = "time")
                      
# Randomly select a pair of subjects to plot profiles of
take <- sample(1:max(heart.jd$survival$num), 2)
heart.jd.1 <- subset(heart.jd, take[1])
heart.jd.2 <- subset(heart.jd, take[2])

plot(heart.jd.1, Y.col = 4)
lines(heart.jd.2, Y.col = 4, lty = 2)



