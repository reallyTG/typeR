### R code from vignette source 'rmhPoster.Rtex'

###################################################
### code chunk number 1: rmhPoster.Rtex:15-148
###################################################
library(lattice)
library(latticeExtra)
library(microplot)

## options needed by Hmisc::latex
options(latexcmd='pdflatex')
options(dviExtension='pdf')
if (nchar(Sys.which("open"))) {
  options(xdvicmd="open")      ## Macintosh, Windows, SMP linux
} else {
  options(xdvicmd="xdg-open")  ## ubuntu linux
}
## Hmisc::latex


## boxplot matrix of iris data
irisBW <-
  bwplot( ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width | Species,
         data=iris, outer=TRUE, as.table=TRUE,
         scales=list(alternating=FALSE),
         xlab=NULL,
         par.strip.text=list(cex=1.5))

## pdf of boxplot matrix
pdf("irisBW.pdf", width=7, height=7)  ## inch
useOuterStrips(irisBW)
suppress <- dev.off()


## twelve individual boxplots without axes
irisBW.update <-
update(irisBW,
       xlab=NULL,
       par.settings=list(
         layout.heights=layoutHeightsCollapse(),
         layout.widths=layoutWidthsCollapse(),
         axis.line=list(col="transparent")),
       layout=c(1,1)
       )

## horizontal axis
irisBW.axis <-
update(irisBW.update[1,1],
       scales=list(cex=.6),
       par.settings=list(layout.heights=list(axis.bottom=1, panel=0),
                         axis.line=list(col="black")))


## create 13 pdf files, one per boxplot and one more for the horizontal axis
pdf("irisBW%03d.pdf", onefile=FALSE, height=.4, width=1.6)  ## inch
irisBW.update  ## 12 individual boxplots without axes
suppress <- dev.off()

pdf("irisBW013.pdf", height=.4, width=1.6)  ## inch
irisBW.axis    ## horizontal axis
suppress <- dev.off()

## construct names of pdf files
graphnames <- paste0("irisBW", sprintf("%03i", 1:13), ".pdf")

## matrix of latex \includegraphics{} macros for each boxplot's pdf file
graphicsnames <- t(matrix(as.includegraphics(graphnames[1:12], height="2em", raise="-1.3ex"),
                          nrow=3, ncol=4,
                          dimnames=dimnames(irisBW)))




## Measurement by Species
BWMS.latex <- Hmisc::latex(graphicsnames, caption="\\Large Measurement by Species", where="!htbp",
                           label="BWMS", title="Measurement", file="BWMS.tex",
                           size="Large")
BWMS.latex$style <- "graphicx"
## BWMS.latex
## Hmisc::dvi(BWMS.latex, width=7, height=3)



## Measurement by Species with Axis
graphicsnamesA <- rbind(graphicsnames, as.includegraphics(graphnames[13], height="2em", raise="-1.3ex"))
BWMSA.latex <- Hmisc::latex(graphicsnamesA, caption="\\Large Measurement by Species, with $x$-scale",
                            where="!htbp",
                            n.rgroup=c(4, 1),
                            rgroup=c("\\vspace*{-1em}", "\\vspace*{-1.25em}"),
                            label="BWMSA", title="Measurement", file="BWMSA.tex",
                            size="Large")
BWMSA.latex$style <- "graphicx"
## BWMSA.latex
## Hmisc::dvi(BWMSA.latex, width=7, height=3)

## Species by Measurement
BWSM.latex <- Hmisc::latex(t(graphicsnames), caption="\\Large Species by Measurement", where="!htbp",
              label="BWSM", title="Species", file="BWSM.tex", size="large")
BWSM.latex$style <- "graphicx"
## BWSM.latex
## Hmisc::dvi(BWSM.latex, width=7.5, height=2)



## Individual boxes embedded into a more interesting table
iris.fivenum <-
sapply(levels(iris$Species),
       function(i) {
         tmp <- sapply(iris[iris$Species==i, 1:4], fivenum)
         dimnames(tmp)[[1]] <- c("min", "Q1", "med", "Q3", "max")
         tmp
       },
       simplify=FALSE)

## Species and Measurement in separate columns
BW5num <-
rbind(
data.frame(t(iris.fivenum[[1]]), "Box Plots"=graphicsnames[,1], check.names=FALSE),
data.frame(t(iris.fivenum[[2]]), "Box Plots"=graphicsnames[,2], check.names=FALSE),
data.frame(t(iris.fivenum[[3]]), "Box Plots"=graphicsnames[,3], check.names=FALSE))
BW5num$Measurement=names(iris)[1:4]
BW5num <- BW5num[, c(7,1:6)]

BW5num.latex <-
   Hmisc::latex(BW5num,
                 rowname=" ",
                 rowlabel="Species",
                 rgroup=levels(iris$Species),
                 n.rgroup=c(4,4,4),
                 cgroup=c("", "Five Number Summary", ""),
                 n.cgroup=c(1, 5, 1),
                 caption="\\Large Five Number Summary and Boxplots for each Species and Measurement",
                 label="irisBW5num",
                 where="!htbp")
BW5num.latex$style <- "graphicx"
## BW5num.latex  ## this line requires latex in the path
## print.default(BW5num.latex)  ## the content of the R variable is the filename of
                                ## the file containing the latex table environment


