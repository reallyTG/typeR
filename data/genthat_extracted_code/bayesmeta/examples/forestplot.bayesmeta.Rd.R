library(bayesmeta)


### Name: forestplot.bayesmeta
### Title: Generate a forest plot for a 'bayesmeta' object (based on the
###   'forestplot' package's plotting functions).
### Aliases: forestplot.bayesmeta
### Keywords: hplot

### ** Examples

# load data:
data("CrinsEtAl2014")

## Not run: 
##D # compute effect sizes (log odds ratios) from count data
##D # (using "metafor" package's "escalc()" function):
##D require("metafor")
##D crins.es <- escalc(measure="OR",
##D                    ai=exp.AR.events,  n1i=exp.total,
##D                    ci=cont.AR.events, n2i=cont.total,
##D                    slab=publication, data=CrinsEtAl2014)
##D print(crins.es)
##D 
##D # perform meta analysis:
##D crins.ma <- bayesmeta(crins.es, tau.prior=function(t){dhalfcauchy(t,scale=1)})
##D 
##D ########################
##D # generate forest plots
##D require("forestplot")
##D 
##D # default options:
##D forestplot(crins.ma)
##D 
##D # exponentiate values (shown in table and plot), show vertical line at OR=1:
##D forestplot(crins.ma, expo=TRUE, zero=1)
##D 
##D # logarithmic x-axis:
##D forestplot(crins.ma, expo=TRUE, xlog=TRUE)
##D 
##D # omit prediction interval:
##D forestplot(crins.ma, predict=FALSE)
##D 
##D # omit shrinkage intervals:
##D forestplot(crins.ma, shrink=FALSE)
##D 
##D # show more decimal places:
##D forestplot(crins.ma, digits=3)
##D 
##D # change table values:
##D # (here: add columns for event counts)
##D fp <- forestplot(crins.ma, expo=TRUE, plot=FALSE)
##D labtext <- fp$labeltext
##D labtext <- cbind(labtext[,1],
##D                  c("treatment",
##D                    paste0(CrinsEtAl2014[,"exp.AR.events"], "/", CrinsEtAl2014[,"exp.total"]),
##D                    "",""),
##D                  c("control",
##D                    paste0(CrinsEtAl2014[,"cont.AR.events"], "/", CrinsEtAl2014[,"cont.total"]),
##D                    "",""),
##D                  labtext[,2:3])
##D labtext[1,4] <- "OR"
##D print(fp$labeltext) # before
##D print(labtext)      # after
##D forestplot(crins.ma, labeltext=labtext, expo=TRUE, xlog=TRUE)
##D 
##D # see also the "forestplot" help for more arguments that you may change,
##D # e.g. the "clip", "xticks", "xlab" and "title" arguments,
##D # or the "txt_gp" argument for label sizes etc.:
##D forestplot(crins.ma, clip=c(-4,1), xticks=(-3):0,
##D            xlab="log-OR", title="pediatric transplantation example",
##D            txt_gp = fpTxtGp(ticks = gpar(cex=1), xlab = gpar(cex=1)))
## End(Not run)



