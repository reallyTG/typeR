library(drfit)


### Name: antifoul
### Title: Dose-Response data for TBT and Zink Pyrithione in IPC-81 cells
### Aliases: antifoul
### Keywords: datasets

### ** Examples

rantifoul.ED50 <- drfit(antifoul,
                        linlogit = TRUE, logit = TRUE, weibull = TRUE,
                        chooseone = FALSE,
                        showED50 = TRUE, EDx = c(10))
print(rantifoul.ED50, digits = 5)

rantifoul.drc <- drcfit(antifoul,
                        linlogit = TRUE, logit = TRUE, weibull = TRUE,
                        chooseone = FALSE,
                        showED50 = TRUE, EDx = c(10))
print(rantifoul.drc, digits = 5)



