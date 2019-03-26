library(phase1PRMD)


### Name: nTTP_summary
### Title: Generate the mean nTTP score and the probability of observing
###   DLT for all doses and cycles
### Aliases: nTTP_summary

### ** Examples


data("prob")

wm <- matrix(c(0, 0.5, 0.75, 1, 1.5,
               0, 0.5, 0.75, 1, 1.5,
               0, 0, 0, 0.5, 1),
             byrow = TRUE, ncol = 5)          # weighted matrix for toxicity matrix
                                              # nrow = No.of type; ncol = No. of grade
toxmax <- 2.5

nTTP.all <- nTTP.array(wm, toxmax)

tox.matrix <- prob["MTD4", "flat", , , , ]

nTTP_summary(tox.matrix, nTTP.all, wm)




