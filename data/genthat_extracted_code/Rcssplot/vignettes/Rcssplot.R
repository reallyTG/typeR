## ----echo = FALSE--------------------------------------------------------
library("Rcssplot")
library("knitr")
opts_chunk$set(fig.pos = "", fig.align = "center")

## helper function to display contents of css files
## f - filename
## remove - number of header lines to remove before displaying
showrcss = function(f, remove=4) {
  fcon = file(f, open="r")
  flines = readLines(fcon)
  close(fcon)
  
  ## remove the first few lines
  flines = flines[(remove+1):length(flines)]
  ## remove the last line if empty
  if (flines[length(flines)]=="") {
    flines = flines[1:(length(flines)-1)]
  }
  ## output the contents of the file on screen
  flines = paste(flines, "\n")
  cat(flines)
}

## ------------------------------------------------------------------------
a <- setNames(c(35, 55, 65, 75, 80, 80), letters[1:6])
a

## ----basebar_1A, eval=FALSE----------------------------------------------
#  barplot(a, main="Base graphics")

## ----basebar_1B, eval=FALSE----------------------------------------------
#  barplot(a, main="Manual tuning", ylab="y label", col="#000080", border=NA, space=0.35)

## ----basebarfun_2, eval = FALSE------------------------------------------
#  ## helper builds a string describing a range
#  range.string <- function(x) {
#      paste0("Data range is [", min(x), ", ", max(x), "]")
#  }
#  ## barplot with several custom settings and components
#  base.barplot.1 <- function(x, main="Custom plot function", ylab="y label") {
#    ## start with a plot with bars, but nothing else
#    barpos <- barplot(x, col="#000080", axes=FALSE, axisnames=FALSE,
#        border=NA, space=0.35)
#    ## add custom components
#    axis(1, at=barpos[,1], labels=names(x), lwd=0, col="#111111", cex.axis=1.2,
#         line=-0.35)
#    axis(2, col.ticks="#444444", col.axis="#444444", cex.axis=1.2, lwd=1.2, las=1,
#         tck=-0.03, lwd.ticks=1.2)
#    mtext(main, adj=0, line=2.2, cex=1.1)
#    mtext(range.string(x), adj=0, line=0.9, cex=0.8, col="#444444")
#    mtext(ylab, side=2, cex=0.8, line=3, col="#444444")
#  }

## ----basebar_1C, eval=FALSE----------------------------------------------
#  base.barplot.1(a)

## ----base_barplot, echo = FALSE, out.width = "0.9\\textwidth", out.height = "0.225\\textwidth", fig.width = 10, fig.height = 2.5, fig.cap = "Charts created with base graphics using: (A) R's {\\tt barplot} function and default settings; (B) R's {\\tt barplot} function and some custom settings; (C) a custom plot function that styles bars, axes, and labels individually. "----
par(mfrow = c(1, 3), mar = c(2, 6, 4.8, 2))

  ## helper builds a string describing a range
  range.string <- function(x) {
      paste0("Data range is [", min(x), ", ", max(x), "]")
  }
  ## barplot with several custom settings and components
  base.barplot.1 <- function(x, main="Custom plot function", ylab="y label") {  
    ## start with a plot with bars, but nothing else
    barpos <- barplot(x, col="#000080", axes=FALSE, axisnames=FALSE, 
        border=NA, space=0.35)
    ## add custom components 
    axis(1, at=barpos[,1], labels=names(x), lwd=0, col="#111111", cex.axis=1.2, 
         line=-0.35)
    axis(2, col.ticks="#444444", col.axis="#444444", cex.axis=1.2, lwd=1.2, las=1, 
         tck=-0.03, lwd.ticks=1.2)
    mtext(main, adj=0, line=2.2, cex=1.1)
    mtext(range.string(x), adj=0, line=0.9, cex=0.8, col="#444444")
    mtext(ylab, side=2, cex=0.8, line=3, col="#444444")
  }
  barplot(a, main="Base graphics")
text(-2, 104, "A", cex=2, xpd=TRUE)
barplot(a, main="Manual tuning", ylab="y label", col="#000080", border=NA, space=0.35)
text(-2, 104, "B", cex=2, xpd=TRUE)
base.barplot.1(a)
text(-2, 104, "C", cex=2, xpd=TRUE)
par(mfrow = c(1, 1))

## ----barrcss_1, eval=TRUE, echo = FALSE, comment=NA----------------------
showrcss("Rcss/vignettes.bar1.Rcss")

## ----barrcss_load1, eval = TRUE------------------------------------------
library("Rcssplot")
style1 <- Rcss("Rcss/vignettes.bar1.Rcss")

## ----barrcss_show, eval = TRUE-------------------------------------------
style1
printRcss(style1, "barplot")

## ----rcssbar_2A, eval=FALSE----------------------------------------------
#  Rcssbarplot(a, main="Rcssbarplot, unstyled", ylab="y label")

## ----rcssbar_2B, eval=FALSE----------------------------------------------
#  Rcssbarplot(a, main="Rcssbarplot, styled", ylab="y label", Rcss=style1)

## ----rcssbar_2C, eval=FALSE----------------------------------------------
#  Rcssbarplot(a, main="Rcssbarplot, override", ylab="y label", space=1, Rcss=style1)

## ----rcss_barplot, echo = FALSE, out.width = "0.9\\textwidth", out.height = "0.225\\textwidth", fig.width = 10, fig.height = 2.5, fig.cap = "Charts created with base graphics and Rcssplot using: (A) the default style; (B) a style determined through a style sheet; (C) a style sheet, but with the bar width over-ridden by a setting within a function call. "----
par(mfrow = c(1, 3), mar = c(2, 6, 4.8, 2))
## barplot using Rcssplot, version 1
rcss.barplot.1 <- function(x, main="Custom Rcss plot", ylab="y label", 
                           Rcss="default", Rcssclass=c()) {
  ## create an empty barplot  
  barpos <- Rcssbarplot(x, axes=FALSE, axisnames=FALSE, Rcss=Rcss, Rcssclass=Rcssclass)
  ## add custom components 
  Rcssaxis(1, at=barpos[,1], labels=names(x), Rcss=Rcss, Rcssclass=c(Rcssclass,"x"))
  Rcssaxis(2, Rcss=Rcss, Rcssclass=c(Rcssclass,"y"))  
  Rcssmtext(main, Rcss=Rcss, Rcssclass=c(Rcssclass,"main"))
  Rcssmtext(range.string(x), Rcss=Rcss, Rcssclass=c(Rcssclass, "submain"))
  Rcssmtext(ylab, side=2, Rcss=Rcss, Rcssclass=c(Rcssclass,"ylab"))
}
  Rcssbarplot(a, main="Rcssbarplot, unstyled", ylab="y label")
text(-2, 104, "A", cex=2, xpd=TRUE)
Rcssbarplot(a, main="Rcssbarplot, styled", ylab="y label", Rcss=style1)
text(-2, 104, "B", cex=2, xpd=TRUE)
Rcssbarplot(a, main="Rcssbarplot, override", ylab="y label", space=1, Rcss=style1)
text(-2, 104, "C", cex=2, xpd=TRUE)
par(mfrow = c(1, 1))

## ----barrcss_2, eval=TRUE, echo = FALSE, comment=NA----------------------
showrcss("Rcss/vignettes.bar2.Rcss")

## ----rcssbarfun_1, eval = FALSE------------------------------------------
#  ## barplot using Rcssplot, version 1
#  rcss.barplot.1 <- function(x, main="Custom Rcss plot", ylab="y label",
#                             Rcss="default", Rcssclass=c()) {
#    ## create an empty barplot
#    barpos <- Rcssbarplot(x, axes=FALSE, axisnames=FALSE, Rcss=Rcss, Rcssclass=Rcssclass)
#    ## add custom components
#    Rcssaxis(1, at=barpos[,1], labels=names(x), Rcss=Rcss, Rcssclass=c(Rcssclass,"x"))
#    Rcssaxis(2, Rcss=Rcss, Rcssclass=c(Rcssclass,"y"))
#    Rcssmtext(main, Rcss=Rcss, Rcssclass=c(Rcssclass,"main"))
#    Rcssmtext(range.string(x), Rcss=Rcss, Rcssclass=c(Rcssclass, "submain"))
#    Rcssmtext(ylab, side=2, Rcss=Rcss, Rcssclass=c(Rcssclass,"ylab"))
#  }

## ----rcssbar_3A, eval=FALSE----------------------------------------------
#  style2 <- Rcss(c("Rcss/vignettes.bar1.Rcss", "Rcss/vignettes.bar2.Rcss"))
#  rcss.barplot.1(a, main="Rcss style2", Rcss=style2)

## ----barrcss_3, eval=TRUE, echo = FALSE, comment=NA----------------------
showrcss("Rcss/vignettes.bar3.Rcss")

## ----rcssbar_3B, eval=FALSE----------------------------------------------
#  style3 <- Rcss(paste0("Rcss/vignettes.bar", c(1, 2, 3), ".Rcss"))
#  rcss.barplot.1(a, main="Rcss style3, class typeB", Rcss=style3, Rcssclass="typeB")

## ----rcssbar_3C, eval=FALSE----------------------------------------------
#  rcss.barplot.1(a, main="Rcss style3, class typeC", Rcss=style3, Rcssclass="typeC")

## ----rcss_custombar, echo = FALSE, out.width = "0.9\\textwidth", out.height = "0.225\\textwidth", fig.width = 10, fig.height = 2.5, fig.cap = "Charts created by custom plot functions with base graphics and Rcssplot using: (A) a style determined by css; (B) a style sub-class defined in css; (C) a style sub-class that is not defined in css (equivalent to (A)). "----
par(mfrow = c(1, 3), mar = c(2, 6, 4.8, 2))
## barplot using Rcssplot, version 1
rcss.barplot.1 <- function(x, main="Custom Rcss plot", ylab="y label", 
                           Rcss="default", Rcssclass=c()) {
  ## create an empty barplot  
  barpos <- Rcssbarplot(x, axes=FALSE, axisnames=FALSE, Rcss=Rcss, Rcssclass=Rcssclass)
  ## add custom components 
  Rcssaxis(1, at=barpos[,1], labels=names(x), Rcss=Rcss, Rcssclass=c(Rcssclass,"x"))
  Rcssaxis(2, Rcss=Rcss, Rcssclass=c(Rcssclass,"y"))  
  Rcssmtext(main, Rcss=Rcss, Rcssclass=c(Rcssclass,"main"))
  Rcssmtext(range.string(x), Rcss=Rcss, Rcssclass=c(Rcssclass, "submain"))
  Rcssmtext(ylab, side=2, Rcss=Rcss, Rcssclass=c(Rcssclass,"ylab"))
}
## reset
RcssCompulsoryClass = NULL
RcssDefaultStyle = NULL
  style2 <- Rcss(c("Rcss/vignettes.bar1.Rcss", "Rcss/vignettes.bar2.Rcss"))
  rcss.barplot.1(a, main="Rcss style2", Rcss=style2)
text(-2, 104, "A", cex=2, xpd=TRUE)
style3 <- Rcss(paste0("Rcss/vignettes.bar", c(1, 2, 3), ".Rcss"))
rcss.barplot.1(a, main="Rcss style3, class typeB", Rcss=style3, Rcssclass="typeB")
text(-2, 104, "B", cex=2, xpd=TRUE)
rcss.barplot.1(a, main="Rcss style3, class typeC", Rcss=style3, Rcssclass="typeC")
text(-2, 104, "C", cex=2, xpd=TRUE)
par(mfrow = c(1, 1))

## ----rbarplot2, eval = TRUE----------------------------------------------
## barplot using Rcssplot, version 2 (using overloading)
rcss.barplot.2 <- function(x, main="Custom Rcss plot", ylab="y label",
                           Rcss="default", Rcssclass=c()) {
  ## overload base graphics function by Rcssplot wrappers
  RcssOverload()    
  ## create a barplot (without Rcss prefixes)
  barpos <- barplot(x, axes=FALSE, axisnames=FALSE, Rcss=Rcss, Rcssclass=Rcssclass)
  axis(1, at=barpos[,1], labels=names(x), Rcss=Rcss, Rcssclass=c(Rcssclass, "x"))
  axis(2, Rcss=Rcss, Rcssclass=c(Rcssclass, "y"))  
  mtext(main, Rcss=Rcss, Rcssclass=c(Rcssclass, "main"))
  mtext(range.string(x), Rcss=Rcss, Rcssclass=c(Rcssclass, "submain"))  
  mtext(ylab, side=2, Rcss=Rcss, Rcssclass=c(Rcssclass, "ylab"))
}

## ----rbarplot3, eval = TRUE----------------------------------------------
## barplot using Rcssplot, version 3 (using defaults & compulsory classes)
rcss.barplot.3 <- function(x, main="Custom Rcss plot", ylab="y label", 
                           Rcss="default", Rcssclass=c()) {
  ## overload base graphics, set defaults and compulsory classes
  RcssOverload()
  RcssDefaultStyle <- RcssGetDefaultStyle(Rcss)
  RcssCompulsoryClass <- RcssGetCompulsoryClass(Rcssclass)
  ## create a barplot (without Rcss arguments)
  barpos <- barplot(x, axes=FALSE, axisnames=FALSE)
  axis(1, at=barpos[,1], labels=names(x), Rcssclass="x")
  axis(2, Rcssclass="y")  
  mtext(main, Rcssclass="main")
  mtext(range.string(x), Rcssclass="submain")  
  mtext(ylab, side=2, Rcssclass="ylab")
}

## ----global, eval=FALSE--------------------------------------------------
#  RcssOverload()
#  RcssDefaultStyle <- style3
#  RcssCompulsoryClass <- c()

## ----rbarplot4, eval = TRUE----------------------------------------------
## barplot using Rcssplot, version 4 (assumes global use of Rcssplot)
rcss.barplot.4 <- function(x, main="Custom Rcss plot", ylab="y label", 
                           Rcssclass="typeB") {
  ## adjust compulsory class
  RcssCompulsoryClass <- RcssGetCompulsoryClass(Rcssclass) 
  ## create a barplot
  barpos <- barplot(x, axes=FALSE, axisnames=FALSE)
  axis(1, at=barpos[,1], labels=names(x), Rcssclass="x")
  axis(2, Rcssclass="y")  
  mtext(main, Rcssclass="main")
  mtext(range.string(x), Rcssclass="submain")  
  mtext(ylab, side=2, Rcssclass="ylab")
}

## ----reset, eval=TRUE----------------------------------------------------
RcssDefaultStyle <- NULL
RcssCompulsoryClass <- NULL

## ----snippet1------------------------------------------------------------
RcssCompulsoryClass <- "bar0"
RcssCompulsoryClass
foo1 <- function() {
    RcssCompulsoryClass <- "bar1"
    RcssCompulsoryClass
}
foo1()

## ----snippet2------------------------------------------------------------
foo2 <- function() {
   RcssCompulsoryClass <- RcssGetCompulsoryClass("bar2")
   RcssCompulsoryClass
}
foo2()
RcssCompulsoryClass

## ----barrcss_4, eval=TRUE, echo = FALSE, comment=NA----------------------
showrcss("Rcss/vignettes.bar4.Rcss")

## ----getprop, eval=TRUE--------------------------------------------------
style4 <- Rcss(paste0("Rcss/vignettes.bar", c(1, 2, 4), ".Rcss"))
RcssProperty("baraxis", "stripe", Rcss=style4)

## ----getprop2------------------------------------------------------------
RcssValue("baraxis", "stripe", default=0, Rcss=style4)
RcssValue("baraxis", "strpe", default=0, Rcss=style4)

## ----barplot6, eval=TRUE-------------------------------------------------
## barplot using Rcssplot, version 5 (uses custom css selectors)
rcss.barplot.5 <- function(x, main="", ylab="Proportion (%)", 
    Rcss="default", Rcssclass=c()) {
  ## use overloading, custom style, compulsary class
  RcssOverload()
  RcssDefaultStyle <- RcssGetDefaultStyle(Rcss)
  RcssCompulsoryClass <- RcssGetCompulsoryClass(Rcssclass)
  ## extract custom properties - show axis? force ylim?
  stripes <- RcssValue("baraxis", "stripe", default=0)
  ylim <- RcssValue("baraxis", "ylim", default=NULL)
  ## create background
  barpos <- barplot(x, axes=FALSE, axisnames=FALSE, ylim=ylim, 
      col="#ffffff", border=NA)
  ## draw a bar chart
  axis(1, at=barpos[,1], labels=names(x), Rcssclass="x")
  if (stripes) {
      stripevals <- axis(2, lwd=0, labels=NA)
      labpos <- axis(2, lwd=0, lwd.ticks=0, Rcssclass="y")
      abline(h=labpos)
  } else {
      axis(2, Rcssclass="y")            
  }
  barplot(x, axes=FALSE, axisnames=FALSE, add=TRUE)
  mtext(main, Rcssclass="main")  
  mtext(range.string(x), Rcssclass="submain")  
  mtext(ylab, side=2, Rcssclass="ylab")
}

## ----stripeA, eval = FALSE-----------------------------------------------
#  rcss.barplot.5(a, main="Stripes", Rcss=style4)

## ----stripeB, eval = FALSE-----------------------------------------------
#  rcss.barplot.5(a, main="Stripes, y-scale 100", Rcss=style4, Rcssclass="dotted")

## ----stripeC, eval = FALSE-----------------------------------------------
#  a2 <- setNames(c(12, 20, 26, 72, 88, 94), tail(letters, 6))
#  rcss.barplot.5(a2, main="... new data", Rcss=style4, Rcssclass="dotted")

## ----fig_stripes, echo = FALSE, out.width = "0.9\\textwidth", out.height = "0.225\\textwidth", fig.width = 10, fig.height = 2.5, fig.cap = "Charts using custom css selectors: (A) horizontal rules instead of a y-axis; (B) styled rules with a fixed vertical scale; (C) again styled rules with a fixed vertical scale, showing new data. "----
par(mfrow = c(1, 3), mar = c(2, 6, 4.8, 2))
rcss.barplot.5(a, main="Stripes", Rcss=style4)
graphics::text(-2, 104, "A", cex=2, xpd=TRUE)
rcss.barplot.5(a, main="Stripes, y-scale 100", Rcss=style4, Rcssclass="dotted")
graphics::text(-2, 130, "B", cex=2, xpd=TRUE)
a2 <- setNames(c(12, 20, 26, 72, 88, 94), tail(letters, 6))
rcss.barplot.5(a2, main="... new data", Rcss=style4, Rcssclass="dotted")
graphics::text(-2, 130, "C", cex=2, xpd=TRUE)
par(mfrow = c(1, 1))

## ----grammar, eval=TRUE, echo = FALSE, comment=NA------------------------
showrcss("Rcss/grammar.txt")

## ------------------------------------------------------------------------
sessionInfo()

