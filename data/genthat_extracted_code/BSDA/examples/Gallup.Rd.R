library(BSDA)


### Name: Gallup
### Title: Results of a Gallup poll on possession of marijuana as a
###   criminal offense conducted in 1980
### Aliases: Gallup
### Keywords: datasets

### ** Examples


T1 <- xtabs(~demographics + opinion, data = Gallup)
T1
t(T1[c(2, 3), ])
barplot(t(T1[c(2, 3), ]))
barplot(t(T1[c(2, 3), ]), beside = TRUE)

## Not run: 
##D library(dplyr)
##D library(ggplot2)
##D dplyr::filter(Gallup, demographics == "Gender: Male" | demographics == "Gender: Female") %>%
##D ggplot2::ggplot(aes(x = demographics, fill = opinion)) + 
##D            geom_bar() + 
##D            theme_bw() + 
##D            labs(y = "Fraction")
## End(Not run)




