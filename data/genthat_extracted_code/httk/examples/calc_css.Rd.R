library(httk)


### Name: calc_css
### Title: Find the steady state concentration and the day it is reached.
### Aliases: calc_css
### Keywords: Steady State

### ** Examples

calc_css(chem.name='Bisphenol-A',doses.per.day=5,f=.001,output.units='mg/L')
## Not run: 
##D parms <- parameterize_3comp(chem.name='Bisphenol-A')
##D parms$Funbound.plasma <- .07
##D calc_css(parms,concentration='blood',model='3compartment')
##D 
##D 
##D library("ggplot2")
##D out <- solve_pbtk(chem.name = "Bisphenol A", days = 50, doses.per.day = 3)
##D plot.data <- as.data.frame(out)
##D css <- calc_analytic_css(chem.name = "Bisphenol A")
##D c.vs.t <- ggplot(plot.data,aes(time, Cplasma)) + geom_line() +
##D geom_hline(yintercept = css) + ylab("Plasma Concentration (uM)") +
##D xlab("Day") + theme(axis.text = element_text(size = 16), axis.title =
##D element_text(size = 16), plot.title = element_text(size = 17)) +
##D ggtitle("Bisphenol A")
##D print(c.vs.t)
##D 
##D days <- NULL
##D avg <- NULL
##D max <- NULL
##D for(this.cas in get_cheminfo()){
##D css.info <- calc_css(chem.cas = this.cas, doses.per.day = 1,suppress.messages=T)
##D days[[this.cas]] <- css.info[["the.day"]]
##D avg[[this.cas]] <- css.info[["avg"]]
##D max[[this.cas]] <- css.info[["max"]]
##D }
##D days.data <- as.data.frame(days)
##D hist <- ggplot(days.data, aes(days)) +
##D geom_histogram(fill = "blue", binwidth = 1/6) + scale_x_log10() +
##D ylab("Number of Chemicals") + xlab("Days") + theme(axis.text =
##D element_text(size = 16), axis.title = element_text(size = 16))
##D print(hist)
##D avg.max.data <- as.data.frame(cbind(avg, max))
##D avg.vs.max <- ggplot(avg.max.data, aes(avg, max)) + geom_point() +
##D geom_abline() + scale_x_log10() + scale_y_log10() +
##D xlab("Average Concentration at Steady State (uM)") +
##D ylab("Max Concentration at Steady State (uM)") +
##D theme(axis.text = element_text(size = 16),
##D axis.title = element_text(size = 16))
##D print(avg.vs.max)
## End(Not run)



