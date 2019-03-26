library(broom)


### Name: glance.binDesign
### Title: Glance at a(n) binDesign object
### Aliases: glance.binDesign

### ** Examples


if (require("binGroup", quietly = TRUE)) {
    des <- binDesign(nmax = 300, delta = 0.06,
                     p.hyp = 0.1, power = .8)

    glance(des)
    tidy(des)

    # the ggplot2 equivalent of plot(des)
    library(ggplot2)
    ggplot(tidy(des), aes(n, power)) +
        geom_line()
}




