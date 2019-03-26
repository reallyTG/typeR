library(httk)


### Name: solve_pbtk
### Title: Solve_PBTK
### Aliases: solve_pbtk
### Keywords: Solve

### ** Examples


solve_pbtk(chem.name='Bisphenol-A',dose=.5,days=1,doses.per.day=2,tsteps=2)
out <- solve_pbtk(chem.name='bisphenola',dose=0,output.units='mg', 
                  plots=TRUE,initial.values=c(Agut=200))
## Not run: 
##D parameters <- parameterize_pbtk(chem.name = "triclosan", species = "rat")
##D parameters["Funbound.plasma"] <- 0.1
##D out <- solve_pbtk(parameters=parameters)
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
## End(Not run)



