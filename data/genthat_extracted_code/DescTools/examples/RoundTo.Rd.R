library(DescTools)


### Name: RoundTo
### Title: Round to Multiple
### Aliases: RoundTo
### Keywords: manip

### ** Examples

RoundTo(10, 3)     # Rounds 10 to a nearest multiple of 3 (9)
RoundTo(-10, -3)   # Rounds -10 to a nearest multiple of -3 (-9)

RoundTo(1.3, 0.2)  # Rounds 1.3 to a nearest multiple of 0.2 (1.2)
RoundTo(-1.3, 0.2) # Rounds -1.3 to a nearest multiple of 0.2 (-1.2)
RoundTo(5, -2)     # Returns an error, because -2 and 5 have different signs

# Round down
RoundTo(c(1,-1) * 1.2335, 0.05, floor)
RoundTo(c(1,-1) * 1233.5, 100, floor)

# Round up
RoundTo(c(1,-1) * 1.2335, 0.05, ceiling)
RoundTo(c(1,-1) * 1233.5, 100, ceiling)

# Round towards zero
RoundTo(c(1,-1) * 1.2335, 0.05, trunc)
RoundTo(c(1,-1) * 1233.5, 100, trunc)


x <- c(-1.5,-1.3, 1.3, 1.5)
cbind(x =       x,
      round =   RoundTo(x, 0.2, FUN=round),
      trunc =   RoundTo(x, 0.2, FUN=trunc),
      ceiling = RoundTo(x, 0.2, FUN=ceiling),
      floor =   RoundTo(x, 0.2, FUN=floor)
)

x <- -10:10
cbind(x =       x,
      round =   RoundTo(x, 2, FUN=round),
      trunc =   RoundTo(x, 2, FUN=trunc),
      ceiling = RoundTo(x, 2, FUN=ceiling),
      floor =   RoundTo(x, 2, FUN=floor)
)




