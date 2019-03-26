library(QCA)


### Name: intersection
### Title: Intersect expressions
### Aliases: intersection
### Keywords: functions

### ** Examples

# using minimization objects
data(LF)
ttLF <- truthTable(LF, outcome = "SURV", incl.cut = 0.8)

pLF <- minimize(ttLF, include = "?")


# for example the intersection between the parsimonious model and
# a theoretical expectation

intersection(pLF, "DEV*STB")

# E1: (DEV*ind + URB*STB)*DEV*STB
#   I1: DEV*ind*STB + DEV*URB*STB


# negating the model
intersection(negate(pLF), "DEV*STB")

# E1: (dev*urb + dev*stb + urb*IND + IND*stb)*DEV*STB
#   I1: DEV*IND*STB*urb


# -----
# in Ragin's (1987) book, the equation E = SG + LW is the result
# of the Boolean minimization for the ethnic political mobilization.

# intersecting the reactive ethnicity perspective (R = lw)
# with the equation E (page 144)
intersection("lw", "SG + LW", snames = "S, L, W, G")

# E1: lw(SG + LW)
#   I1: SlwG


# resources for size and wealth (C = SW) with E (page 145)
intersection("SW", "SG + LW", snames = "S, L, W, G")

# E1: SW(SG + LW)
#   I1: SWG + SLW


# and factorized
factorize(intersection("SW", "SG + LW", snames = "S, L, W, G"))

# M1: SWG + SLW 
#   F1: SW(G + L)


# developmental perspective (D = Lg) and E (page 146)
intersection("Lg", "SG + LW", snames = "S, L, W, G")

# E1: Lg(SG + LW)
#   I1: LWg



