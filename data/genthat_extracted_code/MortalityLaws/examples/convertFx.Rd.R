library(MortalityLaws)


### Name: convertFx
### Title: Convert Life Table Indicators
### Aliases: convertFx

### ** Examples

# Data ---
x  <- 0:110
mx <- ahmd$mx

# mx to qx
qx <- convertFx(x, data = mx, from = "mx", to = "qx")
# mx to dx
dx <- convertFx(x, data = mx, from = "mx", to = "dx")
# mx to lx
lx <- convertFx(x, data = mx, from = "mx", to = "lx")


# There are 28 possible combinations --------------------------------
# Let generate all of them.
from <- c("mx", "qx", "dx", "lx")
to   <- c("mx", "qx", "dx", "lx", "Lx", "Tx", "ex")
K    <- expand.grid(from = from, to = to) # all possible cases/combinations

for (i in 1:nrow(K)) {
  In  <- as.character(K[i, "from"])
  Out <- as.character(K[i, "to"])
  N <- paste0(Out, "_from_", In)
  cat(i, " Create", N, "\n")
  # Create the 28 sets of results
  assign(N, convertFx(x = x, data = get(In), from = In, to = Out))
}



