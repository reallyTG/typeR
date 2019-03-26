library(CorporaCoCo)


### Name: surface
### Title: Calculate Surface Co-occurrence Counts
### Aliases: surface

### ** Examples

    # =====================
    # surface co-occurrence
    # =====================

    x <- c("a", "man", "a", "plan", "a", "canal", "panama")
    surface(x, span = '2R')

    ##         x      y H M
    ##  1:     a      a 2 4
    ##  2:     a  canal 1 5
    ##  3:     a    man 1 5
    ##  4:     a panama 1 5
    ##  5:     a   plan 1 5
    ##  6: canal panama 1 0
    ##  7:   man      a 1 1
    ##  8:   man   plan 1 1
    ##  9:  plan      a 1 1
    ## 10:  plan  canal 1 1


    # filter on nodes
    surface(x, span = '2R', nodes = c("canal", "man", "plan"))

    ##         x      y H M
    ##  1: canal panama 1 0
    ##  2:   man      a 1 1
    ##  3:   man   plan 1 1
    ##  4:  plan      a 1 1
    ##  5:  plan  canal 1 1

    # filter on nodes and collocates
    surface(x, span = '2R', nodes = c("canal", "man", "plan"), collocates = c("panama", "a"))

    ##         x      y H M
    ##  1: canal panama 1 0
    ##  2:   man      a 1 1
    ##  3:  plan      a 1 1


    # co-occurrence barrier
    x <- c("a", "man", "a", "plan", NA, NA, "a", "canal", "panama")
    surface(x, span = '2R')

    #         x      y H M
    #  1:     a      a 1 4
    #  2:     a  canal 1 4
    #  3:     a    man 1 4
    #  4:     a panama 1 4
    #  5:     a   plan 1 4
    #  6: canal panama 1 0
    #  7:   man      a 1 1
    #  8:   man   plan 1 1



