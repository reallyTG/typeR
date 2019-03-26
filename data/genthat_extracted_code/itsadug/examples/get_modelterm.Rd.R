library(itsadug)


### Name: get_modelterm
### Title: Get estimated for selected model terms.
### Aliases: get_modelterm

### ** Examples

data(simdat)

## Not run: 
##D  
##D # Model with random effect and interactions:
##D m1 <- bam(Y ~ s(Time) + s(Trial) 
##D +ti(Time, Trial)
##D +s(Time, Subject, bs='fs', m=1),
##D data=simdat)
##D 
##D # Get list with predictions:
##D p <- get_modelterm(m1, select=1)
##D emptyPlot(range(p$terms), range(p$fit), h=0)
##D plot_error(p$terms, p$fit, p$se.fit, shade=TRUE, xpd=TRUE)
##D 
##D # Plot random effects in separate panels:
##D pp <- get_modelterm(m1, select=4, as.data.frame=TRUE)
##D require(lattice)
##D lattice::xyplot(fit~Time|Subject, 
##D     data=pp, type="l",
##D     xlab="Time", ylab="Partial effect")
##D 
##D # Plot selection of subjects:
##D pp <- get_modelterm(m1, select=4, 
##D     cond=list(Subject=c('a01', 'a03', 'c16')),
##D     as.data.frame=TRUE)
##D lattice::xyplot(fit~Time|Subject, 
##D     data=pp, type="l",
##D     xlab="Time", ylab="Partial effect")
##D 
##D # Or using the package ggplot2:
##D require(ggplot2)
##D pp <- get_modelterm(m1, select=4, as.data.frame=TRUE)
##D pg <- ggplot2::qplot(Time, fit, data = pp, 
##D     geom = c("point", "line"), colour = Subject)
##D pg + ggplot2::guides(col = guide_legend(nrow = 18))
## End(Not run)




