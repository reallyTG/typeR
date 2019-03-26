library(broom)


### Name: tidy.binWidth
### Title: Tidy a(n) binWidth object
### Aliases: tidy.binWidth binwidth_tidiers

### ** Examples


if (require("binGroup", quietly = TRUE)) {
    bw <- binWidth(100, .1)
    bw
    tidy(bw)

    library(dplyr)
    d <- expand.grid(n = seq(100, 800, 100),
                     p = .5,
                     method = c("CP", "Blaker", "Score", "Wald"),
                     stringsAsFactors = FALSE) %>%
        group_by(n, p, method) %>%
        do(tidy(binWidth(.$n, .$p, method = .$method)))

    library(ggplot2)
    ggplot(d, aes(n, ci.width, color = method)) +
        geom_line() +
        xlab("Total Observations") +
        ylab("Expected CI Width")
}




