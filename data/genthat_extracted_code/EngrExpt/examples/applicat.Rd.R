library(EngrExpt)


### Name: applicat
### Title: Application of powder coating
### Aliases: applicat
### Keywords: datasets

### ** Examples

str(applicat)
dotplot(distance ~ gloss|flowrate, applicat, groups = charge,
        type = c("p","a"), layout = c(1,2),
        ylab = "Gun distance from target (in.)",
        strip = FALSE, strip.left = TRUE,
        auto.key = list(columns = 3, lines = TRUE), xlab =
"Gloss for two flow rates (gm/min) and three charges (kvolts)")
dotplot(charge ~ gloss|flowrate, applicat, groups = distance, 
        type = c("p","a"), layout = c(1,2),
        ylab = "Charge (kvolts)",
        strip = FALSE, strip.left = TRUE,
        auto.key = list(columns = 3, lines = TRUE), xlab =
"Gloss for two flow rates (gm/min) and three distances from target (in)")



