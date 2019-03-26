library(metasens)


### Name: plot.copas
### Title: Display results of Copas selection modelling
### Aliases: plot.copas
### Keywords: hplot

### ** Examples

##
## Simple example:
##
## Load data
##
data(Fleiss93)
##
## Perform meta-analysis (outcome measure is OR = odds ratio)
##
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, sm="OR")
##
## Perform copas analysis
##
cop1 <- copas(meta1)
##
## Plot results
##
plot(cop1)
##
## Only do plots 1 and 2 (without orthogonal line)
##
plot(cop1, which=1:2, orth=FALSE)
##
## Another example showing use of arguments
## Note the use of \n to create a new line in the caption
##
plot(cop1,
     which=3,
     caption=c("", "",
               "Variation in estimated treatment\n effect with selection",
               ""),
     xlim.pp=c(1,0.5))



