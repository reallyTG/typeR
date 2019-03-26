library(VGAM)


### Name: Opt
### Title: Optimums
### Aliases: Opt
### Keywords: models regression

### ** Examples

set.seed(111)  # This leads to the global solution
hspider[,1:6] <- scale(hspider[,1:6])  # Standardized environmental vars
p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute, Arctperi,
                Auloalbi, Pardlugu, Pardmont, Pardnigr, Pardpull,
                Trocterr, Zoraspin) ~
          WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
          family = poissonff, data = hspider, Crow1positive = FALSE)
Opt(p1)

## Not run: 
##D clr <- (1:(ncol(depvar(p1))+1))[-7]  # Omits yellow
##D persp(p1, col = clr, las = 1, main = "Vertical lines at the optimums")
##D abline(v = Opt(p1), lty = 2, col = clr)
## End(Not run)



