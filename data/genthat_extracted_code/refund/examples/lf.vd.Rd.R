library(refund)


### Name: lf.vd
### Title: Construct a VDFR regression term
### Aliases: lf.vd

### ** Examples

## Not run: 
##D   data(sofa)
##D   fit.vd1 <- pfr(death ~ lf.vd(SOFA) + age + los,
##D                  family="binomial", data=sofa)
##D   fit.vd2 <- pfr(death ~ lf.vd(SOFA, transform="lagged") + age + los,
##D                  family="binomial", data=sofa)
##D   fit.vd3 <- pfr(death ~ lf.vd(SOFA, transform="standardized") + age + los,
##D                  family="binomial", data=sofa)
##D   fit.vd4 <- pfr(death ~ lf.vd(SOFA, transform="standardized",
##D                                basistype="te") + age + los,
##D                  family="binomial", data=sofa)
##D   fit.vd5 <- pfr(death ~ lf.vd(SOFA, transform="linear", bs="ps") + age + los,
##D                  family="binomial", data=sofa)
##D   fit.vd6 <- pfr(death ~ lf.vd(SOFA, transform="quadratic", bs="ps") + age + los,
##D                  family="binomial", data=sofa)
##D   fit.vd7 <- pfr(death ~ lf.vd(SOFA, transform="noInteraction", bs="ps") + age + los,
##D                  family="binomial", data=sofa)
##D   
##D   ests <- lapply(1:7, function(i) {
##D     c.i <- coef(get(paste0("fit.vd", i)), n=173, n2=173) 
##D     c.i[(c.i$SOFA.arg <= c.i$SOFA.vd),]
##D   })
##D   
##D   # Try plotting for each i
##D   i <- 1
##D   lims <- c(-2,8)
##D   if (requireNamespace("ggplot2", quietly = TRUE) &
##D       requireNamespace("RColorBrewer", quietly = TRUE)) {
##D         est <- ests[[i]]
##D         est$value[est$value<lims[1]] <- lims[1]
##D         est$value[est$value>lims[2]] <- lims[2]
##D         ggplot2::ggplot(est, ggplot2::aes(SOFA.arg, SOFA.vd)) +
##D           ggplot2::geom_tile(ggplot2::aes(colour=value, fill=value)) +
##D           ggplot2::scale_fill_gradientn(  name="", limits=lims,
##D                     colours=rev(RColorBrewer::brewer.pal(11,"Spectral"))) +
##D           ggplot2::scale_colour_gradientn(name="", limits=lims,
##D                     colours=rev(RColorBrewer::brewer.pal(11,"Spectral"))) +
##D           ggplot2::scale_y_continuous(expand = c(0,0)) +
##D           ggplot2::scale_x_continuous(expand = c(0,0)) +
##D           ggplot2::theme_bw()
##D   }
## End(Not run)
  



