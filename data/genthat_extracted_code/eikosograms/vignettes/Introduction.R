## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
set.seed(12314159)

## ----libraries-----------------------------------------------------------
library(eikosograms)
library(gridExtra)

## ---- echo = FALSE, message = FALSE, warning = FALSE, error = FALSE, fig.width=4, fig.height=3, fig.align="center", out.width="30%", fig.cap = "Application to Waterloo's Faculty of Mathematics (2017)"----
Waterloo <- data.frame(Decision = c(rep("Accepted", 1200), 
                                    rep("Rejected", 15200-1200)))
eikos("Decision", data = Waterloo)

## ----Berkeley table, echo = FALSE----------------------------------------
str(UCBAdmissions)

## ----UCB admissions, echo = TRUE, fig.width=4, fig.height=3, fig.align="center", out.width="30%"----
eikos("Admit", data = UCBAdmissions)

## ----UCB departments, echo = TRUE, fig.width=4, fig.height=3, fig.align="center", out.width="30%"----
eikos("Dept", data = UCBAdmissions)

## ----UCB gender marginals, echo = TRUE, fig.width=4, fig.height=3.5, fig.align="center", out.width="30%"----
eikos("Gender", data = UCBAdmissions)

## ----UCB Dept by male, echo = TRUE, fig.width=4, fig.height=3.5, fig.align="center", out.width="30%"----
eikos("Dept", data = UCBAdmissions[,"Male",], 
      main = "Applications from males")

## ----UCB Dept by female, echo = TRUE, fig.width=4, fig.height=3.5, fig.align="center", out.width="30%"----
eikos("Dept", data = UCBAdmissions[,"Female",], 
      main = "Applications from females")

## ----UCB Dept by gender, echo = TRUE, fig.width=4.3, fig.height=3.3, fig.align="center", out.width="30%"----
eikos(y = "Dept", x = "Gender",  data = UCBAdmissions,
      xprobs_size = 8, yprobs_size = 8)

## ----UCB Dept by gender joint, echo = TRUE, fig.width=4, fig.height=3.65, fig.align="center", out.width="30%"----
eikos(y = "Dept", x = "Gender", data = UCBAdmissions, 
      xlabs = FALSE, yaxs = FALSE, xaxs = FALSE)


## ----UCB Dept marginalized, echo = TRUE, fig.width=4, fig.height=3.65, fig.align="center", out.width="30%"----
eikos("Dept", data = UCBAdmissions, 
      xlabs = FALSE, yaxs = FALSE, xaxs = FALSE)

## ----admit given gender, echo = TRUE, fig.width=4, fig.height=3, fig.align="center", out.width="30%"----
eikos(y = "Admit", x = "Gender", data = UCBAdmissions)

## ----gender given admit, echo = TRUE, fig.width=4, fig.height=3, fig.align="center", out.width="30%"----
eikos(y = "Gender", x = "Admit", data = UCBAdmissions)

## ----independence Y given X, echo = TRUE, fig.width=4,fig.height=3.5, fig.align="center",out.width="30%",fig.cap = "Independence of variates X and Y"----
indep <- as.table(array(c(10, 40, 15, 60),
                        dim = c(2,2),
                        dimnames = 
                        list(X =c("x_1", "x_2"), 
                             Y = c("y_1", "y_2"))))
eikos("Y", "X", data = indep)

## ----independence X given Y, echo = TRUE, fig.width=4, fig.height=3.5, fig.align="center", out.width="30%", fig.cap = "Independence of variates X and Y"----
eikos("X", "Y", data = indep)

## ----coincident events, echo = FALSE, fig.width=8, fig.height=3.7, fig.align="center", out.width="50%"----
coincident <- array(c(0.3,0,0,0.7), dim = c(2,2),
                  dimnames = list(A=c("Yes", "No"), B = c("Yes", "No")))
e1 <- eikos("A", "B", data = coincident, 
            xaxs = FALSE, yaxs = FALSE, main = "A occurs iff B does", draw=FALSE)
e2 <- eikos("B", "A", data = coincident, 
            xaxs = FALSE, yaxs = FALSE, main = "B occurs iff A does", draw=FALSE)
grid.arrange(e1, e2, nrow = 1)

## ----complementary events, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
complementary <- array(c(0,0.7,0.3,0), dim = c(2,2),
                  dimnames = list(A=c("Yes", "No"), B = c("Yes", "No")))
e1 <- eikos("A", "B", data = complementary, 
            xaxs = FALSE, yaxs = FALSE, main = paste("If B occurs, A cannot;",
                                                     "if B does not, A must.",
                                                     sep = "\n"), draw=FALSE)
e2 <- eikos("B", "A", data = complementary, 
            xaxs = FALSE, yaxs = FALSE, main = paste("If A occurs, B cannot;",
                                                     "if A does not, B must.",
                                                     sep = "\n"), draw=FALSE)
grid.arrange(e1, e2, nrow = 1)

## ----mutually exclusive events, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
mutualExclusive <- array(c(0,0.3, 0.5, 0.7), dim = c(2,2),
                  dimnames = list(A=c("Yes", "No"), B = c("Yes", "No")))
e1 <- eikos("A", "B", data = mutualExclusive, 
            xaxs = FALSE, yaxs = FALSE, main = paste("If B occurs, A cannot;",
                                                     "if B does not, A could",
                                                     sep = "\n"), draw=FALSE)
e2 <- eikos("B", "A", data = mutualExclusive, 
            xaxs = FALSE, yaxs = FALSE, main = paste("If A occurs, B cannot;",
                                                     "if A does not, B could",
                                                     sep = "\n"), draw=FALSE)
grid.arrange(e1, e2, nrow = 1)

## ----positively associated events, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
posAsso <- array(c(24, 14, 6, 56), dim = c(2,2),
                  dimnames = list(A=c("Yes", "No"), B = c("Yes", "No")))
e1 <- eikos("A", "B", data = posAsso, 
            xaxs = FALSE, yaxs = FALSE, main = paste("A occurs more often when B occurs",
                                                     "than when B does not occur.",
                                                     sep = "\n"), draw=FALSE)
e2 <- eikos("B", "A", data = posAsso, 
            xaxs = FALSE, yaxs = FALSE, main = paste("B occurs more often when A occurs",
                                                     "than when A does not occur.",
                                                     sep = "\n"), draw=FALSE)
grid.arrange(e1, e2, nrow = 1)

## ----negatively associated events, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
negAsso <- array(c(6, 56, 24, 14), dim = c(2,2),
                  dimnames = list(A=c("Yes", "No"), B = c("Yes", "No")))
e1 <- eikos("A", "B", data = negAsso, 
            xaxs = FALSE, yaxs = FALSE, main = paste("A occurs less often when B occurs",
                                                     "than it does when B does not.",
                                                     sep = "\n"), draw=FALSE)
e2 <- eikos("B", "A", data = negAsso, 
            xaxs = FALSE, yaxs = FALSE, main = paste("B occurs less often when A occurs",
                                                     "than it does when A does not.",
                                                     sep = "\n"), draw=FALSE)
grid.arrange(e1, e2, nrow = 1)

## ----spectrum, echo = FALSE, fig.width=20, fig.height=4, fig.align="center", out.width="80%"----
coincident <- as.table(array(c(50, 0, 0, 50),
                        dim = c(2,2),
                        dimnames = 
                        list(A =c("Yes", "No"), 
                             B = c("Yes", "No"))))
posAsso <- as.table(array(c(35, 15, 15, 35),
                        dim = c(2,2),
                        dimnames = 
                        list(A =c("Yes", "No"), 
                             B = c("Yes", "No"))))
indep <- as.table(array(c(25, 25, 25, 25),
                        dim = c(2,2),
                        dimnames = 
                        list(A =c("Yes", "No"), 
                             B = c("Yes", "No"))))
negAsso <- as.table(array(c(15, 35, 35, 15),
                        dim = c(2,2),
                        dimnames = 
                        list(A =c("Yes", "No"), 
                             B = c("Yes", "No"))))
complementary <- as.table(array(c(0, 50, 50, 0),
                        dim = c(2,2),
                        dimnames = 
                        list(A =c("Yes", "No"), 
                             B = c("Yes", "No"))))
e1 <- eikos("A", "B", data = coincident, bottomcol = "steelblue",
            xaxs = FALSE, yaxs = FALSE, main = "Coincident", draw=FALSE)
e2 <- eikos("A", "B", data = posAsso, bottomcol = "steelblue", 
            xaxs = FALSE, yaxs = FALSE, main = "Positive association", draw=FALSE)
e3 <- eikos("A", "B", data = indep, bottomcol = "steelblue", 
            xaxs = FALSE, yaxs = FALSE, main = "Independent", draw=FALSE)
e4 <- eikos("A", "B", data = negAsso, bottomcol = "steelblue", 
            xaxs = FALSE, yaxs = FALSE, main = "Negative association", draw=FALSE)
e5 <- eikos("A", "B", data = complementary,  bottomcol = "steelblue",
            xaxs = FALSE, yaxs = FALSE, main = "Complementary", draw=FALSE)

grid.arrange(e1, e2, e3, e4, e5, nrow = 1)

## ----conditional independence example, echo = FALSE, fig.width=16, fig.height=5, fig.align="center", out.width="70%"----
joint <- array(c(6, 3, 12, 6, 10, 15, 10, 15), 
               dim = c(2,2,2),
               dimnames = list(X=c("X=x1", "X=x2"), 
                               Y = c("Y=y1", "Y=y2"), 
                               Z = c("Z=z1", "Z=z2")))
e1 <- eikos("Y", c("X", "Z"), data = joint, main = "Y | X & Z",
            xaxs = FALSE, xlabs = TRUE, yaxs = FALSE, ylabs = TRUE, draw = FALSE)
e2 <- eikos("X", c("Y", "Z"), data = joint, main = "X | Y & Z",
            xaxs = FALSE, xlabs = TRUE, yaxs = FALSE, ylabs = TRUE, draw = FALSE)
e3 <- eikos("Z", c("X", "Y"), data = joint, main = "Z | X & Y",
            xaxs = FALSE, xlabs = TRUE, yaxs = FALSE, ylabs = TRUE, draw = FALSE)
grid.arrange(e1, e2, e3, nrow = 1)

