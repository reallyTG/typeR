library(HH)


### Name: panel.cartesian
### Title: trellis panel function, with labeled rows and columns and
###   without strip labels.
### Aliases: panel.cartesian
### Keywords: hplot

### ** Examples

data(rent)  ## Weisberg's file alr162

rent.lm <- lm(rnt.alf ~ rnt.till + cow.dens + lime, data=rent)
rent$resid.rent <- resid(rent.lm)

xysplom(resid.rent ~ rnt.till + cow.dens | lime, data=rent,
        layout=c(2,2))

xysplom(resid.rent ~ rnt.till + cow.dens | lime, data=rent,
        layout=c(2,2),
        xlab="", ylab="",
        x.label="", y.label="",
        group.label.side="",
        par.strip.text=list(cex=1.2),
        panel=panel.cartesian,
        axis3.line=2.4,
        scales=list(
          relation="same",
          alternating=FALSE, labels=FALSE, ticks=FALSE),
        between=list(x=1, y=3))

xysplom(resid.rent ~ rnt.till + cow.dens | lime, data=rent,
        layout=c(2,2),
        xlab="", ylab="",
        x.label="", y.label="",
        group.label.side="",
        par.strip.text=list(cex=1.2),
        panel=panel.cartesian,
        axis3.line=3.6,
        scales=list(
          relation="same",
          alternating=FALSE, labels=FALSE, ticks=FALSE),
        rescale=list(x=FALSE, y=FALSE),
        between=list(x=1, y=3))

xysplom(resid.rent ~ rnt.till + cow.dens | lime, data=rent,
        layout=c(2,2),
        xlab="", ylab="",
        x.label="", y.label="",
        group.label.side="",
        par.strip.text=list(cex=1.2),
        panel=panel.cartesian,
        axis3.line=3.6,
        scales=list(
          relation="free",
          alternating=FALSE, labels=FALSE, ticks=FALSE),
        between=list(x=1, y=3))

tmp <-
xysplom(resid.rent ~ rnt.till + cow.dens | lime, data=rent,
        layout=c(2,2),
        xlab="", ylab="",
        y.label="resid",
        group.label.side="top",
        par.strip.text=list(cex=1.2),
        panel=panel.cartesian,
        axis3.line=3.6,
        scales=list(alternating=FALSE, labels=FALSE, ticks=FALSE),
        rescale=list(x=FALSE, y=FALSE),
        between=list(x=4, y=5))
if.R(r=tmp$par.settings <- list(layout.widths=list(right.padding=4)),
     s={})
tmp




