library(ioanalysis)


### Name: locate.mismatch
### Title: Identify Sectors not in All Regions
### Aliases: locate.mismatch

### ** Examples

data(toy.IO)
class(toy.IO)
# No mismatches
MM1 <- locate.mismatch(toy.IO)

# Making toy.IO have mismatches
toy.IO$RS_label <- rbind(toy.IO$RS_label,
                         c("Valhalla", "Wii"),
                         c("Valhalla", "Pizza"),
                         c("Valhalla", "Pizza"),
                         c("Valhalla", "Minions"))
MM2 <- locate.mismatch(toy.IO)
MM2$Lightsabers



