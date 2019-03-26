library(siplab)


### Name: efficiency
### Title: Efficiency Functions
### Aliases: efficiency flat.eff tass.eff gates.eff gnomon.eff

### ** Examples

# Example multi-species efficiency function (spruce/hardwoods)
multi.eff <- function (dx, dy, marks, par) {
    out <- numeric(length(dx))
    s <- marks$SPECIES == "Spruce"
    out[s] <- gnomon.eff(dx[s], dy[s], marks[s, ], par=list(a=par$aS,
        b=par$bS, smark=par$smark))
    out[!s] <- gnomon.eff(dx[!s], dy[!s], marks[!s, ], par=list(a=par$aH,
        b=par$bH, smark=par$smark)) # Hardwoods
    return(out)
}



