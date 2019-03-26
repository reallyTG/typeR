## ----setup, echo=FALSE, results="hide"--------------------------------------------------
library("knitr")
opts_chunk$set(fig.align="center", fig.width=6, fig.height=6)
options(width=90)

## ---------------------------------------------------------------------------------------
library("mountainplot")
data(singer, package = "lattice")
parts <- within(singer, {
section <- voice.part
section <- gsub(" 1", "", section)
section <- gsub(" 2", "", section)
section <- factor(section)
})
# Change levels to logical ordering
levels(parts$section) <- c("Bass","Tenor","Alto","Soprano")

## ----ecdf-------------------------------------------------------------------------------
require(latticeExtra) # for ecdfplot
ecdfplot(~height|section, data = parts, groups=voice.part, type='l',
         layout=c(1,4),
         main="Empirical CDF",
         auto.key=list(columns=4), as.table=TRUE)

## ----mtn--------------------------------------------------------------------------------
mountainplot(~height|section, data = parts,
             groups=voice.part, type='l',
             layout=c(1,4),
             main="Folded Empirical CDF",
             auto.key=list(columns=4), as.table=TRUE)

## ---------------------------------------------------------------------------------------
dmice <- data.frame(
  albumen=c(156,282,197,297,116,127,119,29,253,122,349,110,143,64,26,86,122,455,655,14,
          391,46,469,86,174,133,13,499,168,62,127,276,176,146,108,276,50,73,
          82,100,98,150,243,68,228,131,73,18,20,100,72,133,465,40,46,34, 44),
  group=c(rep('normal',20), rep('alloxan', 18), rep('insulin', 19))
)
mountainplot(~albumen, data=dmice, group=group, auto.key=list(columns=3),
             main="Diabetic mice", xlab="Nitrogen-bound bovine serum albumen")

## ----session----------------------------------------------------------------------------
sessionInfo()

