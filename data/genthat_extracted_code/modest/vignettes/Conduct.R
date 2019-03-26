## ---- echo=FALSE, results='asis'-----------------------------------------
tab <- data.frame(Cohort = rep(1:3, each=3),
                  Dose = rep(c(1.5, 2.25), c(6, 3)),
                  Toxicity = c(rep(0, 7), 1, 0))
knitr::kable(tab, align='c')

