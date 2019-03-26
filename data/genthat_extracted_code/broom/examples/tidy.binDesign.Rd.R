library(broom)


### Name: tidy.binDesign
### Title: Tidy a(n) binDesign object
### Aliases: tidy.binDesign bindesign_tidiers

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




