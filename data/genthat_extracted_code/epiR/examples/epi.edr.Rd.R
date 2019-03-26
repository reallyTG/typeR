library(epiR)


### Name: epi.edr
### Title: Estimated dissemination ratio
### Aliases: epi.edr
### Keywords: univar

### ** Examples

set.seed(123)
dat <- rpois(n = 50, lambda = 2) 
edr.04 <- epi.edr(dat, n = 4, conf.level = 0.95, nsim = 99, na.zero = TRUE)
sdate <- as.Date(x = "31/12/2015", format = "%d/%m/%Y")

dat.04 <- data.frame(idate = sdate + 1:50, est = edr.04$est, 
   low = edr.04$lower, upp = edr.04$upper)

## Line plot of EDR (and its 95% confidence interval) as a function of 
## calendar time:

## Not run: 
##D library(ggplot2)
##D 
##D ggplot(dat.04, aes(x = as.integer(idate), y = est)) + 
##D    geom_line() +
##D    geom_line(dat = dat.04, aes(x = as.integer(idate), y = upp), 
##D       lty = 3, size = 0.5) +
##D    geom_line(dat = dat.04, aes(x = as.integer(idate), y = low), 
##D       lty = 3, size = 0.5) +
##D    scale_x_continuous(name = "Date", 
##D       breaks = seq(from = min(as.integer(dat.04$idate)), 
##D          to = max(as.integer(dat.04$idate)), by = 7), 
##D       labels = seq(from = min(dat.04$idate), 
##D          to = max(dat.04$idate), by = 7), 
##D       limits = c(min(as.integer(dat.04$idate)), 
##D          max(as.integer(dat.04$idate)))) +
##D    scale_y_continuous(name = "Estimated disemination ratio (EDR)", 
##D    limits = c(0,10)) +
##D    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, size = 10)) +
##D    geom_hline(yintercept = 1, lty = 2)
##D  
## End(Not run)



