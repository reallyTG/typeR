library(phase1PRMD)


### Name: nTTP.array
### Title: Generate the nTTP dictionary
### Aliases: nTTP.array

### ** Examples

wm = matrix(c(0, 0.5, 0.75, 1, 1.5,
              0, 0.5, 0.75, 1, 1.5,
              0, 0, 0, 0.5, 1),
            byrow = TRUE, ncol = 5)          # weighted matrix for toxicity matrix
                                             # nrow = No.of type; ncol = No. of grade
toxmax = 2.5

nTTP.array(wm, toxmax)




