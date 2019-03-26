## ------------------------------------------------------------------------
library(ggguitar)
library(tibble)
library(ggplot2)

# Ignoring warnings
options( warn = -1 )

## ------------------------------------------------------------------------
G_M <- c(3, 2, 0, 0, 0, 3)

## ------------------------------------------------------------------------
ggguitar::tablature('G Major', G_M)

## ------------------------------------------------------------------------
B_M <- c(NA, 2, 4, 4, 4, 2)
ggguitar::tablature('B Major', B_M)

## ------------------------------------------------------------------------
C_M <- c(NA, 3, 2, 0, 1, 0)
ggguitar::tablature('C Major', C_M)

## ------------------------------------------------------------------------
C_M_bar <- c(8, 10, 10, 9, 8, 8)
ggguitar::tablature('C Major (bar)', C_M_bar)

## ---- fig.width=6--------------------------------------------------------
D_M <- c(NA, NA, 0, 2, 3, 2)
F_M7 <- c(NA, NA, 3, 2, 1, 0)
e_m <- c(0, 2, 2, 0, 0, 0)
a_m <- c(NA, 0, 2, 2, 1, 0)
b_m <- c(NA, 2, 4, 4, 3, 2)

G_Major <- tablature('G Major', G_M)
C_Major <- tablature('C Major', C_M, TRUE, FALSE)
D_Major <- tablature('D Major', D_M, FALSE, FALSE)
e_minor <- tablature('e minor', e_m)
a_minor <- tablature('a minor', a_m, TRUE, FALSE)
b_minor <- tablature('b minor', b_m)

gridExtra::grid.arrange(G_Major, C_Major, D_Major,
              a_minor, b_minor, e_minor,
              ncol = 3)

## ------------------------------------------------------------------------
tablature("A7", c(5, NA, 5, 6, 5, NA), dot_labels=c("Root", NA, "7th", "3rd", "5th", NA))

## ------------------------------------------------------------------------
tablature("A7", c(5, NA, 5, 6, 5, NA), dot_labels=c("R", NA, "7", "3", "5", NA), dot_label_size = 5)

## ------------------------------------------------------------------------
G_M_scale <- c(3, 0,0,0,NA,NA,
               NA,2,2,NA,NA,NA,
               NA,3,4,NA,NA,NA)

tablature('G Major Scale', 
           G_M_scale,
           dot_labels=c(2, 0,0,0,NA,NA,
                        NA, 1,1,NA,NA,NA,
                        NA, 2,3,NA,NA,NA), 
           dot_label_size = 5)

## ------------------------------------------------------------------------
ggguitar::tablature('G Major (Left-handed)', 
                    rev(G_M), 
                    x_labels = c(1,2,3,4,5,6))

## ------------------------------------------------------------------------
sessionInfo()

