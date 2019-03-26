library(popEpi)


### Name: lines.survtab
### Title: 'lines' method for survtab objects
### Aliases: lines.survtab

### ** Examples

data(sire)
data(sibr)
si <- rbind(sire, sibr)
si$period <- cut(si$dg_date, as.Date(c("1993-01-01", "2004-01-01", "2013-01-01")), right = FALSE)
si$cancer <- c(rep("rectal", nrow(sire)), rep("breast", nrow(sibr)))
x <- lexpand(si, birth = bi_date, entry = dg_date, exit = ex_date, 
             status = status %in% 1:2, 
             fot = 0:5, aggre = list(cancer, period, fot))
st <- survtab_ag(fot ~ cancer + period, data = x, 
                 surv.method = "lifetable", surv.type = "surv.obs")

plot(st, "surv.obs", subset = cancer == "breast", ylim = c(0.5, 1), col = "blue")
lines(st, "surv.obs", subset = cancer == "rectal", col = "red")

## or
plot(st, "surv.obs", col = c(2,2,4,4), lty = c(1, 2, 1, 2))



