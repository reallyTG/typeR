library(physiology)


### Name: henderson_hasselbalch
### Title: pH by Henderson Hasselbalch equation
### Aliases: henderson_hasselbalch

### ** Examples

 bicarbonate <- seq(10, 50, 5)
 pp_co2 <- seq(20, 70, 10)
 bc <- rep(bicarbonate, length(pp_co2))
 pp <- rep(pp_co2, each = length(bicarbonate))
 acidbase <- matrix(henderson_hasselbalch(bc, pp), nrow = 9, ncol = 6)
 rownames(acidbase) <- paste("bicarb", bicarbonate)
 colnames(acidbase) <- paste("PaCO2", pp_co2)
 acidbase



