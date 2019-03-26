library(AmpliconDuo)


### Name: plotAmpliconduo
### Title: Frequency-Frequency Plot Focusing On Significant Deviations In
###   Amplicon Occurences
### Aliases: plotAmpliconduo
### Keywords: hplot

### ** Examples

## load example data
data(amplicons)

## extract the second ampliconduo data frame
ampliconduo2 <- amplicons[[2]]

## plot the amplicon frequencies of the ampliconduo data frame 
plotAmpliconduo(ampliconduo2, main = "ampliconduo_2")
plotAmpliconduo(ampliconduo2, main = "ampliconduo_2", h.start = 50, log = "")
plotAmpliconduo(ampliconduo2, h.start = 50, log = "", asp = 2, corrected = FALSE)



