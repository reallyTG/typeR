library(QCA)


### Name: Interpret SOP expressions: translate, compute, sop
### Title: Functions to interpret or create a SOP expression
### Aliases: translate compute sop
### Keywords: functions

### ** Examples


translate("A + B*C")

# same thing in multivalue notation
translate("A{1} + B{1}*C{1}")

# using upper/lower letters
translate("A + b*C")

# the negation with tilde is recognised
translate("~A + b*C")

# even in combination of upper/lower letters
translate("~A + ~b*C")

# and even for multivalue variables
# in multivalue notation, the product sign * is redundant
translate("C{1} + T{2} + T{1}V{0} + C{0}")

# negation of multivalue sets requires the number of levels
translate("~A{1} + ~B{0}*C{1}", snames = "A, B, C", noflevels = c(2,2,2))

# multiple values can be specified
translate("C{1} + T{1,2} + T{1}V{0} + C{0}")

# or even negated
translate("C{1} + ~T{1,2} + T{1}V{0} + C{0}", snames = "C, T, V", noflevels = c(2,3,2))

# if the expression does not contain the product sign *
# snames are required to complete the translation 
translate("AB + cD", snames = "A, B, C, D")

# otherwise snames are not required
translate("PER*FECT + str*ing")

# snames are required
translate("PERFECT + string", snames = "PER, FECT, STR, ING")

# it works even with overlapping columns
# SU overlaps with SUB in SUBER, but the result is still correct
translate("SUBER + subset", "SU, BER, SUB, SET")

## Not run: 
##D # error because combinations of condition names clash
##D translate("SUPER + subset", "SUP, ER, SU, PER, SUB, SET")
## End(Not run)


# to print _all_ codes from the standard output matrix
(obj <- translate("A + b*C"))
print(obj, original = TRUE) # also prints the -1 code



# -----
# for compute()
data(LF)
compute("DEV*ind + URB*STB", data = LF)

# calculating individual paths
compute("DEV*ind + URB*STB", data = LF, separate = TRUE)



# -----
# for sop()
sop("(A + B)(A + ~B)") # result is "A"

# to force a certain order of the set names
sop("(URB + LIT*~DEV)(~LIT + ~DEV)", snames = "DEV, URB, LIT")

# multilevel conditions can also be specified (and negated)
sop("(A{1} + ~B{0})(B{1} + C{0})", snames = "A, B, C", noflevels = c(2, 3, 2))


# in Ragin's (1987) book, the equation E = SG + LW is the result
# of the Boolean minimization for the ethnic political mobilization.

# intersecting the reactive ethnicity perspective (R = lw)
# with the equation E (page 144)

sop("lw(SG + LW)", snames = "S, L, W, G")

# [1] "SlwG"


# resources for size and wealth (C = SW) with E (page 145)
sop("SW(SG + LW)", snames = "S, L, W, G")

# [1] "SWG + SLW"


# and factorized
factorize(sop("SW(SG + LW)", snames = "S, L, W, G"))

# F1: SW(G + L)


# developmental perspective (D = Lg) and E (page 146)
sop("Lg(SG + LW)", snames = "S, L, W, G", use.tilde = TRUE)

# [1] "LW~G"



