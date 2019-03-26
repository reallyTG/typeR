## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
set.seed(12314159)

## ----libraries-----------------------------------------------------------
library(eikosograms)
library(gridExtra)

## ----set up conditional independence tables, eval = TRUE, echo = FALSE----
# This function will create all the joint probabilities
# and place them in the appropriate three-way table
create3WayBinaryTable <- function(widths, heights) {
    toprow_eikos <- widths * (1 - heights)
    bottomrow_eikos <- widths * heights
    probs <- array(c(bottomrow_eikos, toprow_eikos),
                  dim = c(2,2,2),
                  dimnames = list(Z = c("z1", "z2"),
                                  X = c("x1", "x2"),
                                  Y = c("y1", "y2")
                  ))
    as.table(probs)
}
# Marginal probabilities (widths) for 
# the two binary conditioning variates
# are given by the xz values,
# and the conditional probabilities (heights)
# for the response variate's first value
# are given by the b values.
# Figure numbers here refer to those figure numbers of
# the original Oldford (2003) article entitled
# "Understanding probabilistic independence and its 
#  modelling via Eikosograms and graphs."
xz1 <- c(2/7, 8/35, 1/7, 12/35)
b1 <- c(4/5, 1/2, 3/10, 7/10)
fig5a_data <-  create3WayBinaryTable(xz1, b1)
b2 <- c(4/5, 1/2, 3/5, 1/5)
fig5b_data <-  create3WayBinaryTable(xz1, b2)
b3 <- c(4/5, 1/2, 4/5, 1/2)
fig5c_data <-  create3WayBinaryTable(xz1, b3)
b4 <- c(7/10, 7/10, 7/10, 7/10)
fig6_data <- create3WayBinaryTable(xz1, b4)
xz2 <- c(10/33, 4/11, 5/33, 2/11)
fig7_data <- create3WayBinaryTable(xz2, b4)
xz3 <- c(1/3, 1/6, 1/3, 1/6)
b5 <- c(7/10, 7/10, 3/10, 3/10)
fig8_data <- create3WayBinaryTable(xz2, b5)
xz4 <- c(2/9, 1/9, 2/9, 4/9)
b6 <- c(2/3, 2/3, 1/6, 1/6)
fig9_data <- create3WayBinaryTable(xz4, b6)
xz5 <- c(1/7, 1/7, 3/7, 2/7)
b7 <- c(1/3, 2/3, 1/4, 1/6)
fig11_data <- create3WayBinaryTable(xz5, b7)
xz6 <- c(1/4, 1/4, 1/4, 1/4)
b8 <- c(3/4, 1/2, 1/4, 1/4)
fig12_data <- create3WayBinaryTable(xz6, b8)
xz7 <- c(1/3, 1/6, 1/3, 1/6)
b9 <- c(2/3, 1/2, 5/6, 1/6)
fig13_data <- create3WayBinaryTable(xz7, b9)
xz8 <- c(1/6, 1/3, 1/6, 1/3)
b10 <- c(1/6, 2/3, 5/6, 1/3)
fig14_data <- create3WayBinaryTable(xz8, b10)

# Create this now for early illustration
cond_indep <- fig5c_data

## ----independence Y given X, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "Independence of variates X and Y"----
independenceExample <- as.table(array(c(10, 40, 15, 60),
                        dim = c(2,2),
                        dimnames = 
                        list(X =c("x_1", "x_2"), 
                             Y = c("y_1", "y_2"))))

## ----bivariate independence 1, eval = FALSE, echo = TRUE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%"----
#  eikos("Y", "X", data = independenceExample)

## ----png bivariate independence 1, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "Independence of variates Y and X"----
include_graphics("img/IndependenceExploration/indepYX.png")

## ----bivariate independence 2, eval = FALSE, echo = TRUE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%"----
#  eikos("X", "Y", data = independenceExample)

## ----png bivariate independence 2, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "Independence of variates X and Y"----
include_graphics("img/IndependenceExploration/indepXY.png")

## ----conditional independence, eval = FALSE, echo = TRUE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%"----
#  eikos("Y", c("X",  "Z"), data = cond_indep, xaxs = FALSE, yaxs = FALSE)

## ----png conditional independence, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "Conditional independence of variates Y and X given Z"----
include_graphics("img/IndependenceExploration/indepYgivenXZ.png")

## ----table creation function , echo = TRUE, eval = FALSE-----------------
#  # This function will create all the joint probabilities
#  # and place them in the appropriate three-way table
#  create3WayBinaryTable <- function(widths, heights) {
#      toprow_eikos <- widths * (1 - heights)
#      bottomrow_eikos <- widths * heights
#      probs <- array(c(bottomrow_eikos, toprow_eikos),
#                    dim = c(2,2,2),
#                    dimnames = list(Z = c("z1", "z2"),
#                                    X = c("x1", "x2"),
#                                    Y = c("y1", "y2")
#                    ))
#      as.table(probs)
#  }

## ----some table, echo = TRUE, eval = TRUE--------------------------------
someTable <-   create3WayBinaryTable(widths =  c(10/35, 8/35, 5/35, 12/35),
                                     heights = c(7/10, 7/10, 7/10, 7/10))

## ----cond_indep table, echo = FALSE--------------------------------------
knitr::kable(cond_indep)

## ----eikos of someTable, eval = FALSE, echo = TRUE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%"----
#  eikos(y="Y", x = c("Z", "X"), data = someTable)

## ----png eikos of someTable, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "What is the independence structure?"----
include_graphics("img/IndependenceExploration/someTableYgivenZX.png")

## ----conditional independence tables display, echo = FALSE, eval = FALSE----
#  # Marginal probabilities (widths) for
#  # the two binary conditioning variates
#  # are given by the xz values,
#  # and the conditional probabilities (heights)
#  # for the response variate's first value
#  # are given by the b values.
#  # Figure numbers here refer to those figure numbers of
#  # the original Oldford (2003) article entitled
#  # "Understanding probabilistic independence and its
#  #  modelling via Eikosograms and graphs."
#  xz1 <- c(2/7, 8/35, 1/7, 12/35)
#  b1 <- c(4/5, 1/2, 3/10, 7/10)
#  fig5a_data <-  create3WayBinaryTable(xz1, b1)
#  b2 <- c(4/5, 1/2, 3/5, 1/5)
#  fig5b_data <-  create3WayBinaryTable(xz1, b2)
#  b3 <- c(4/5, 1/2, 4/5, 1/2)
#  fig5c_data <-  create3WayBinaryTable(xz1, b3)
#  b4 <- c(7/10, 7/10, 7/10, 7/10)
#  fig6_data <- create3WayBinaryTable(xz1, b4)
#  xz2 <- c(10/33, 4/11, 5/33, 2/11)
#  fig7_data <- create3WayBinaryTable(xz2, b4)
#  xz3 <- c(1/3, 1/6, 1/3, 1/6)
#  b5 <- c(7/10, 7/10, 3/10, 3/10)
#  fig8_data <- create3WayBinaryTable(xz2, b5)
#  xz4 <- c(2/9, 1/9, 2/9, 4/9)
#  b6 <- c(2/3, 2/3, 1/6, 1/6)
#  fig9_data <- create3WayBinaryTable(xz4, b6)
#  xz5 <- c(1/7, 1/7, 3/7, 2/7)
#  b7 <- c(1/3, 2/3, 1/4, 1/6)
#  fig11_data <- create3WayBinaryTable(xz5, b7)
#  xz6 <- c(1/4, 1/4, 1/4, 1/4)
#  b8 <- c(3/4, 1/2, 1/4, 1/4)
#  fig12_data <- create3WayBinary Table(xz6, b8)
#  xz7 <- c(1/3, 1/6, 1/3, 1/6)
#  b9 <- c(2/3, 1/2, 5/6, 1/6)
#  fig13_data <- create3WayBinaryTable(xz7, b9)
#  xz8 <- c(1/6, 1/3, 1/6, 1/3)
#  b10 <- c(1/6, 2/3, 5/6, 1/3)
#  fig14_data <- create3WayBinaryTable(xz8, b10)
#  

## ----complete independence table, echo = TRUE----------------------------
complete_indep <- create3WayBinaryTable(widths = c(10/33, 12/33, 5/33, 6/33),
                                        heights = c(7/10, 7/10, 7/10, 7/10))

## ----complete independence code, eval = TRUE, fig.height = 0.1-----------
eikosY <- eikos(y="Y", x = c("Z", "X"), 
                xaxs = FALSE, yaxs= FALSE,
                data = complete_indep, draw = FALSE)
eikosX <- eikos(y="X", x = c("Z", "Y"), 
                xaxs = FALSE, yaxs= FALSE,
                data = complete_indep, draw = FALSE)
eikosZ <- eikos(y="Z", x = c("X", "Y"), 
                xaxs = FALSE, yaxs= FALSE,
                data = complete_indep, draw = FALSE)

## ----complete independence arrange 3, eval = FALSE, echo = TRUE, fig.width=11, fig.height=3.5, fig.align="center", out.width="100%"----
#  grid.arrange(eikosY, eikosX, eikosZ, nrow=1)

## ----png complete independence arrange 3, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "Complete independence"----
include_graphics("img/IndependenceExploration/completeIndep.png")

## ----conditional on one, echo = TRUE, fig.width=9, fig.height=0.1, fig.align="center",  out.width="80%"----
eikosYX <- eikos(y = "Y", x = "X",
                 data = complete_indep, main = "Y | X",
                 xaxs = FALSE, yaxs= FALSE, draw = FALSE)
eikosYZ <- eikos(y = "Y", x = "Z",
                 data = complete_indep, main = "Y | Z",
                 xaxs = FALSE, yaxs= FALSE, draw = FALSE)
eikosXZ <- eikos(y = "X", x = "Z", 
                 data = complete_indep, main = "X | Z",
                 xaxs = FALSE, yaxs= FALSE, draw = FALSE)

## ----conditional on one arranged, eval = FALSE, echo = TRUE, fig.width=10, fig.height=3, fig.align="center", out.width="80%"----
#  grid.arrange(eikosYX, eikosYZ, eikosXZ, nrow = 1)

## ----png conditional on one arranged, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "Pairwise independence"----
include_graphics("img/IndependenceExploration/pairwise.png")

## ----grid code, eval = TRUE, fig.height = 0.1----------------------------
layout3and2way <- function(table) {
    if(length(dimnames(table))!=3) stop("Must be a three-way table")
    varNames <- names(dimnames(table))
    zVar <- varNames[1]
    xVar <- varNames[2]
    yVar <- varNames[3]
    eikosY <- eikos(y = yVar, x = c(zVar, xVar),
                    data = table, main = paste0(yVar, " | ", zVar, "&", xVar),
                    xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, 
                    draw = FALSE)
    eikosX <- eikos(y = xVar, x = c(zVar, yVar), 
                    data = table, main = paste0(xVar, " | ", zVar, "&", yVar),
                    xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, 
                    draw = FALSE)
    eikosZ <- eikos(y = zVar, x = c(xVar, yVar), 
                    data = table, main = paste0(zVar, " | ", xVar, "&", yVar),
                    xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, 
                    draw = FALSE)
    eikosYX <- eikos(y = yVar, x = xVar,
                     data = table, main = paste(yVar, xVar, sep =" | "),
                     xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, 
                     draw = FALSE)
    eikosYZ <- eikos(y = yVar, x = zVar,
                     data = table, main = paste(yVar, zVar, sep =" | "),
                     xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, 
                     draw = FALSE)
    eikosXY <- eikos(y = xVar, x = yVar, 
                     data = table, main = paste(xVar, yVar, sep =" | "),
                     xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, 
                     draw = FALSE)
    eikosXZ <- eikos(y = xVar, x = zVar, 
                     data = table, main = paste(xVar, zVar, sep =" | "),
                     xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, draw = FALSE)
    eikosZY <- eikos(y = zVar, x = yVar, 
                     data = table, main = paste(zVar, yVar, sep =" | "),
                     xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, draw = FALSE)
    eikosZX <- eikos(y = zVar, x = xVar,  
                     data = table, main = paste(zVar, xVar, sep =" | "),
                     xlabs = FALSE, ylabs = FALSE, xaxs = FALSE, yaxs= FALSE, 
                     draw = FALSE)
    layout <- rbind(c(1,1, NA, 2, 2, NA,  3, 3),
                    rep(NA, 8),
                    c(4, 5, NA, 6, 7, NA, 8, 9))
    grid.arrange(eikosY, eikosX, eikosZ,
                 eikosYX, eikosYZ, 
                 eikosXY, eikosXZ, 
                 eikosZY, eikosZX,
                 layout_matrix = layout,
                 widths = c(2,2,1,2,2,1,2,2), 
                 heights = c(2, 0.5, 1.1)
    )
}

## ----complete independence layout, eval = FALSE, echo = TRUE, fig.width=11, fig.height=5.5, fig.align="center", out.width="80%"----
#  layout3and2way(complete_indep)

## ----png complete independence layout, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "Complete independence"----
include_graphics("img/IndependenceExploration/complete_indep.png")

## ----Case 2, eval = FALSE, echo = TRUE, fig.width=11, fig.height=5.5, fig.align="center", out.width="80%"----
#  table <- create3WayBinaryTable(widths = c(10/33, 12/33, 5/33, 6/33),
#                                 heights = c(7/10, 7/10, 3/10, 3/10))
#  
#  layout3and2way(table)

## ----png Case2, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "One 4-flat; two 2 by 2 flats"----
include_graphics("img/IndependenceExploration/case2.png")

## ----Case 3, eval = FALSE, echo = TRUE, fig.width=11, fig.height=5.5, fig.align="center", out.width="80%"----
#  table <- create3WayBinaryTable(widths = c(2/9, 1/9, 2/9, 4/9),
#                                 heights = c(2/3, 2/3, 1/6, 1/6))
#  
#  layout3and2way(table)

## ----png Case 3, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "One no-flat; two 2 by 2 flats"----
include_graphics("img/IndependenceExploration/case3.png")

## ----Case 4.1, eval = FALSE, echo = TRUE, fig.width=11, fig.height=5.5, fig.align="center", out.width="80%"----
#  table <- create3WayBinaryTable(widths = c(1/7, 1/7, 3/7, 2/7),
#                                 heights = c(1/3, 2/3, 1/4, 1/6))
#  
#  layout3and2way(table)

## ----png Case 4.1, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "No flats; no marginal independence"----
include_graphics("img/IndependenceExploration/case41.png")

## ----Case 4.2, eval = FALSE, echo = TRUE, fig.width=11, fig.height=5.5, fig.align="center", out.width="80%"----
#  table <- create3WayBinaryTable(widths = c(1/4, 1/4, 1/4, 1/4),
#                                 heights = c(3/4, 1/2, 1/4, 1/4))
#  
#  layout3and2way(table)

## ----png Case 4.2, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "No flats; one marginal independence"----
include_graphics("img/IndependenceExploration/case42.png")

## ----Case 4.3, eval = FALSE, echo = TRUE, fig.width=11, fig.height=5.5, fig.align="center", out.width="80%"----
#  table <- create3WayBinaryTable(widths = c(2/6, 1/6, 2/6, 1/6),
#                                 heights = c(2/3, 1/2, 5/6, 1/6))
#  
#  layout3and2way(table)

## ----png Case 4.3, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "No flats; two marginal independences"----
include_graphics("img/IndependenceExploration/case43.png")

## ----Case 4.4, eval = FALSE, echo = TRUE, fig.width=11, fig.height=5.5, fig.align="center", out.width="80%"----
#  table <- create3WayBinaryTable(widths = c(1/6, 2/6, 1/6, 2/6),
#                                 heights = c(1/6, 2/3, 5/6, 1/3))
#  
#  layout3and2way(table)

## ----png Case 4.4, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3.5, fig.align="center", out.width="50%", fig.cap = "No flats; three marginal independences"----
include_graphics("img/IndependenceExploration/case44.png")

