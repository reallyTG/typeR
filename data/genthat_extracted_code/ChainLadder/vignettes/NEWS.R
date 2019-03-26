## ----setup, include=FALSE, echo=FALSE------------------------------------
knitr::opts_chunk$set(echo = TRUE)
suppressPackageStartupMessages(library(ChainLadder))

## ----fig.width = 4, fig.height=3-----------------------------------------
x <- GenIns
rownames(x) <- paste0(2001:2010, "-01-01")
x

## ------------------------------------------------------------------------
plot(x, lattice=TRUE)

## ------------------------------------------------------------------------
x <- GenInsLong
# start off y with x's headings
y <- x[0,]
names(y)[1] <- "lossdate"
set.seed(1234)
n = 50 # number of simulated claims per accident perior
for (i in 1:nrow(x)) {
  y <- rbind(y,
             data.frame(
               lossdate = as.Date(
                 as.numeric(as.Date(paste0(x[i, "accyear"]+2000, "-01-01"))) +
                   round(runif(n, 0, 364),0), origin = "1970-01-01"),
               devyear = x[i, "devyear"],
               incurred.claims = rnorm(n, mean = x[i, "incurred claims"] / n,
                                         sd = x[i, "incurred claims"]/(10*n))
             ))
}
# here's the magic cut
y$ay <- cut(y$lossdate, breaks = "years")
# this summarized triangle is very similar to GenIns
as.triangle(y, origin = "ay", dev = "devyear", value = "incurred.claims")

## ----long----------------------------------------------------------------
GenLong <- as.LongTriangle(GenIns, varnames = c("accident year", "development age"),
                           value.name = "Incurred Loss")
head(GenLong)

## ----plotlong------------------------------------------------------------
library(ggplot2)
ggplot(GenLong, aes(x=`development age`, y = `Incurred Loss`,
                    group = `accident year`, color = `accident year`)) +
  geom_line()

## ------------------------------------------------------------------------
  GenIns2 <- GenIns
  rownames(GenIns2) <- paste0(2001:2010, "-01-01")
  expos <- (7 + 1:10 * 0.4) * 10
  names(expos) <- rownames(GenIns2)
  attr(GenIns2, "exposure") <- expos
  glmReserve(GenIns2)

## ------------------------------------------------------------------------
(fit6 <- glmReserve(GenIns, nb = TRUE))

## ----echo = FALSE--------------------------------------------------------
x <- matrix(byrow = TRUE, nrow = 4, ncol = 4, 
            dimnames = list(origin = LETTERS[1:4], dev = 1:4),
            data = c(
              100, 105, 106, 106.5,
              200, 210, 211, NA,
              300, 315, NA, NA,
              400, NA, NA, NA)
            )

## ------------------------------------------------------------------------
mcl <- MackChainLadder(x, est.sigma = "Mack")

