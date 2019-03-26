library(HH)


### Name: ae.dotplot
### Title: AE (Adverse Events) dotplot of incidence and relative risk
### Aliases: ae.dotplot AE.dotplot ae.dotplot.long aeReshapeToLong
###   panel.ae.leftplot panel.ae.rightplot panel.ae.dotplot logrelrisk
### Keywords: hplot htest

### ** Examples

## variable names in the input data.frame aeanonym
## RAND   treatment as randomized
## PREF   adverse event symptom name
## SN     number of patients in treatment group
## SAE    number of patients  in each group for whom the event PREF was observed
##
## Input sort order is PREF/RAND

data(aeanonym)
head(aeanonym)

## Calculate log relative risk and confidence intervals (95% by default).
## logrelrisk sets the sort order for PREF to match the relative risk.
aeanonymr <- logrelrisk(aeanonym) ## sorts by relative risk
head(aeanonymr)

## construct and print plot on current graphics device
ae.dotplot(aeanonymr,
           A.name="TREATMENT A (N=216)",
           B.name="TREATMENT B (N=431)")
## export.eps(h2("stdt/figure/aerelrisk.eps"))
## This looks great on screen and exports badly to eps.
## We recommend drawing this plot directly to the postscript device:
##
## trellis.device(postscript, color=TRUE, horizontal=TRUE,
##                colors=ps.colors.rgb[
##                  c("black", "blue", "red", "green",
##                    "yellow", "cyan","magenta","brown"),],
##                onefile=FALSE, print.it=FALSE,
##                file=h2("stdt/figure/aerelrisk.ps"))
## ae.dotplot(aeanonymr,
##            A.name="TREATMENT A (N=216)",
##            B.name="TREATMENT B (N=431)")
## dev.off()

## To change the sort order, redefine the PREF factor.
## For this example, to plot alphabetically, use the statement
aeanonymr$PREF <- ordered(aeanonymr$PREF, levels=sort(levels(aeanonymr$PREF)))
ae.dotplot(aeanonymr,
           A.name="TREATMENT A (N=216)",
           B.name="TREATMENT B (N=431)",
           main.title="change the main title to reflect the new sort order")

## Not run: 
##D ## to restore the order back to the default, use
##D relrisk <- aeanonymr[seq(1, nrow(aeanonymr), 2), "relrisk"]
##D PREF <- unique(aeanonymr$PREF)
##D aeanonymr$PREF <- ordered(aeanonymr$PREF, levels=PREF[order(relrisk)])
##D ae.dotplot(aeanonymr,
##D            A.name="TREATMENT A (N=216)",
##D            B.name="TREATMENT B (N=431)",
##D            main.title="back to the original sort order")
##D 
##D ## smaller artifical example with the wide format
##D aewide <- data.frame(Event=letters[1:6],
##D                      N.A=c(50,50,50,50,50,50),
##D                      N.B=c(90,90,90,90,90,90),
##D                      AE.A=2*(1:6),
##D                      AE.B=1:6)
##D aewtol <- aeReshapeToLong(aewide)
##D xr <- logrelrisk(aewtol)
##D ae.dotplot(xr)
## End(Not run)



