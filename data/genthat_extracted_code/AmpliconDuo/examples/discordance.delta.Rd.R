library(AmpliconDuo)


### Name: discordance.delta
### Title: Measure Of Discordance Between Two Amplicon Data Sets
### Aliases: discordance.delta
### Keywords: htest

### ** Examples

## load example ampliconduo data frame
data(amplicons)

## calculate the discordance between amplicon data sets of an ampliconduo data frame
dd.a <- discordance.delta(amplicons)
dd.b <- discordance.delta(amplicons, theta = 0.1)
dd.c <- discordance.delta(amplicons, printToTex = TRUE)



