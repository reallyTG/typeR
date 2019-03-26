library(hyperSpec)


### Name: qplotspc
### Title: Spectra plotting with ggplot2
### Aliases: qplotspc

### ** Examples


  qplotspc (chondro)

  qplotspc (paracetamol, c (2800 ~ max, min ~ 1800)) + scale_x_reverse (breaks = seq (0, 3200, 400))

  qplotspc (aggregate (chondro, chondro$clusters, mean),
            mapping = aes (x = .wavelength, y = spc, colour = clusters)) +
    facet_grid (clusters ~ .)

  qplotspc (aggregate (chondro, chondro$clusters, mean_pm_sd),
            mapping = aes (x = .wavelength, y = spc, colour = clusters, group = .rownames)) +
    facet_grid (clusters ~ .)



