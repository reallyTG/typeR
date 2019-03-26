## ---- echo=FALSE, results='asis'-----------------------------------------
tab1 <- data.frame(Design = c("Standard", "Potent", "Inactive", "Steep", "Very potent", "Very inactive"),
                   LowDose = c(1.0, 1.2, 0.8, 0.8, 1.4, 0.6),
                   HighDose = c(1.0, 1.2, 0.8, 1.2, 1.4, 0.6))
knitr::kable(tab1, align='c')

## ---- echo=FALSE, results='asis'-----------------------------------------
tab2 <- data.frame(Design = c("Standard", "Potent", "Inactive", "Steep", "Very potent", "Very inactive"),
                   LowDose = c(0.20, 0.24, 0.16, 0.16, 0.35, 0.15),
                   HighDose = c(0.45, 0.54, 0.36, 0.54, 0.63, 0.27))
knitr::kable(tab2, align='c')

