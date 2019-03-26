library(broom)


### Name: tidy.rcorr
### Title: Tidy a(n) rcorr object
### Aliases: tidy.rcorr rcorr_tidiers Hmisc_tidiers

### ** Examples


if (requireNamespace("Hmisc", quietly = TRUE)) {

    library(Hmisc)
    
    mat <- replicate(52, rnorm(100))
    # add some NAs
    mat[sample(length(mat), 2000)] <- NA
    # also column names
    colnames(mat) <- c(LETTERS, letters)

    rc <- rcorr(mat)

    td <- tidy(rc)
    td

    library(ggplot2)
    ggplot(td, aes(p.value)) +
        geom_histogram(binwidth = .1)

    ggplot(td, aes(estimate, p.value)) +
        geom_point() +
        scale_y_log10()
}




