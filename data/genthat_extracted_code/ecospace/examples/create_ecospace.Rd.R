library(ecospace)


### Name: create_ecospace
### Title: Create Ecospace Framework.
### Aliases: create_ecospace

### ** Examples

# Create random ecospace framework with all character types
set.seed(88)
nchar <- 10
char.state <- rpois(nchar, 1) + 2
char.type <- replace(char.state, char.state <= 3, "numeric")
char.type <- replace(char.type, char.state == 4, "ord.num")
char.type <- replace(char.type, char.state == 5, "ord.fac")
char.type <- replace(char.type, char.state > 5, "factor")
# Good practice to confirm everything matches expectations:
data.frame(char=seq(nchar), char.state, char.type)
ecospace <- create_ecospace(nchar, char.state, char.type, constraint=Inf)
ecospace

# How many life habits in this ecospace are theoretically possible?
seq <- seq(nchar)
prod(sapply(seq, function(seq) length(ecospace[[seq]]$allowed.combos)))
# ~12 million

# Observe effect of constraint for binary characters
create_ecospace(1, 4, "numeric", constraint=Inf)[[1]]$char.space
create_ecospace(1, 4, "numeric", constraint=2)[[1]]$char.space
create_ecospace(1, 4, "numeric", constraint=1)[[1]]$char.space
try(create_ecospace(1, 4, "numeric", constraint=1.5)[[1]]$char.space) # ERROR!
try(create_ecospace(1, 4, "numeric", constraint=0)[[1]]$char.space) # ERROR!

# Using custom-weighting for traits (singletons weighted twice as frequent
#   as other state combinations)
weight.file <- c(rep(2, 3), rep(1, 3), 2, 2, 1, rep(1, 4), rep(2, 3), rep(1, 3),
rep(1, 14), 2, 2, 1, rep(1, 4), rep(2, 3), rep(1, 3), rep(1, 5))
create_ecospace(nchar, char.state, char.type, constraint=2,
  weight.file=weight.file)

# Bambach's (1983, 1985) classic ecospace framework
# 3 characters, all factors with variable states
nchar <- 3
char.state <- c(3, 4, 4)
char.type <- c("ord.fac", "factor", "factor")
char.names <- c("Tier", "Diet", "Activity")
state.names <- c("Pelag", "Epif", "Inf", "SuspFeed", "Herb", "Carn", "DepFeed",
  "Mobile/ShallowActive", "AttachLow/ShallowPassive", "AttachHigh/DeepActive",
  "Recline/DeepPassive")
ecospace <- create_ecospace(nchar, char.state, char.type, char.names, state.names)
ecospace
seq <- seq(nchar)
prod(sapply(seq, function(seq) length(ecospace[[seq]]$allowed.combos)))
# 48 possible life habits

# Bush and Bambach's (Bambach et al. 2007, bush et al. 2007) updated ecospace
#   framework, with Bush et al. (2011) and Bush and Bambach (2011) addition of
#   osmotrophy as a possible diet category
#   3 characters, all factors with variable states
nchar <- 3
char.state <- c(6, 6, 7)
char.type <- c("ord.fac", "ord.fac", "factor")
char.names <- c("Tier", "Motility", "Diet")
state.names <- c("Pelag", "Erect", "Surfic", "Semi-inf", "ShallowInf", "DeepInf",
  "FastMotile", "SlowMotile ", "UnattachFacMot", "AttachFacMot", "UnattachNonmot",
  "AttachNonmot", "SuspFeed", "SurfDepFeed", "Mining", "Grazing", "Predation",
  "Absorpt/Osmotr", "Other")
ecospace <- create_ecospace(nchar, char.state, char.type, char.names, state.names)
ecospace
seq <- seq(nchar)
prod(sapply(seq, function(seq) length(ecospace[[seq]]$allowed.combos)))
# 252 possible life habits

# Novack-Gottshall (2007) ecospace framework, updated in Novack-Gottshall (2016b)
#   Fossil species pool from Late Ordovician (Type Cincinnatian) Kope and
#   Waynesville Formations, with functional-trait characters coded according
#   to Novack-Gottshall (2007, 2016b)
data(KWTraits)
head(KWTraits)
nchar <- 18
char.state <- c(2, 7, 3, 3, 2, 2, 5, 5, 2, 5, 2, 2, 5, 2, 5, 5, 3, 3)
char.type <- c("numeric", "ord.num", "numeric", "numeric", "numeric", "numeric",
  "ord.num", "ord.num", "numeric", "ord.num", "numeric", "numeric", "ord.num",
  "numeric", "ord.num", "numeric", "numeric", "numeric")
char.names <- c("Reproduction", "Size", "Substrate composition", "Substrate
  consistency", "Supported", "Attached", "Mobility", "Absolute tier", "Absolute
  microhabitat", "Relative tier", "Relative microhabitat", "Absolute food
  microhabitat", "Absolute food tier", "Relative food microhabitat", "Relative
  food tier", "Feeding habit", "Diet", "Food condition")
state.names <- c("SEXL", "ASEX", "BVOL", "BIOT", "LITH", "FLUD", "HARD", "SOFT",
  "INSB", "SPRT", "SSUP", "ATTD", "FRLV", "MOBL", "ABST", "AABS", "IABS", "RLST",
  "AREL", "IREL", "FAAB", "FIAB", "FAST", "FARL", "FIRL", "FRST", "AMBT", "FILT",
  "ATTF", "MASS", "RAPT", "AUTO", "MICR", "CARN", "INCP", "PART", "BULK")
ecospace <- create_ecospace(nchar, char.state, char.type, char.names, state.names,
  constraint=2, weight.file=KWTraits)
ecospace
seq <- seq(nchar)
prod(sapply(seq, function(seq) length(ecospace[[seq]]$allowed.combos)))
# ~57 billion life habits

ecospace <- create_ecospace(nchar, char.state, char.type, char.names, state.names,
  constraint=Inf)
ecospace
seq <- seq(nchar)
prod(sapply(seq, function(seq) length(ecospace[[seq]]$allowed.combos)))
# ~3.6 trillion life habits




