library(icesTAF)


### Name: taf.colors
### Title: TAF Colors
### Aliases: taf.colors taf.green taf.orange taf.blue taf.dark taf.light

### ** Examples

taf.green

par(mfrow=c(3,1))

barplot(5:1, main="Five",
        col=c(taf.green, taf.orange, taf.blue, taf.dark, taf.light))

barplot(6:1, main="Six", col=c(taf.green, taf.orange, taf.blue,
                               taf.dark, taf.light, "white"))

barplot(7:1, main="Seven", col=c("black", taf.dark, taf.light,
                                 taf.green, taf.orange, taf.blue, "white"))



