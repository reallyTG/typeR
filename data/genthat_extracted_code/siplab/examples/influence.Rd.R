library(siplab)


### Name: influence
### Title: Influence Functions
### Aliases: influence zoi.inf tass.inf gates.inf gnomon.inf

### ** Examples

# Example multi-species influence function (spruce/hardwoods)
multi.inf <- function (dx, dy, marks, par) {
    out <- numeric(length(dx))
    s <- marks$SPECIES == "Spruce"
    out[s] <- gnomon.inf(dx[s], dy[s], marks[s, ], par=list(a=par$aS,
        b=par$bS, smark=par$smark))
    out[!s] <- gnomon.inf(dx[!s], dy[!s], marks[!s, ], par=list(a=par$aH,
        b=par$bH, smark=par$smark)) # Hardwoods
    return(out)
}



