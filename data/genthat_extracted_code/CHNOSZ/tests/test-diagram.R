context("diagram")

test_that("expected errors are produced for inconsistent arguments", {
  expect_error(diagram(list()), "'eout' does not look like output from equil\\(\\) or affinity\\(\\)")
  basis("CHNOS")
  species(c("glycine", "alanine"))
  a <- affinity()
  expect_message(diagram(a, plot.it=FALSE), "balance: moles of CO2 in formation reactions")
  e <- equilibrate(a)
  expect_error(diagram(e, "Z"), "Z is not a valid diagram type")
})

test_that("expected messages, errors and results arise using output from affinity()", {
  basis("CHNOS+")
  # fugacity of O2 is buffered here
  basis("O2", "CO2-AC")
  species(c("formic acid", "formate", "acetic acid", "acetate"))
  # 0-D
  a <- affinity()
  # equilibrium activities are not possible here
  expect_error(diagram(a, "loga.equil"), "'eout' is not the output from equil\\(\\)")
  # we can't calculate the equilibrium activity of a basis species if it's externally buffered
  expect_error(diagram(a, "O2"), "is not numeric - was a buffer selected\\?")
  # this one works - a barplot of A/2.303RT
  expect_message(diagram(a, plot.it=FALSE), "balance: moles of CO2 in formation reactions")
  # if we're plotting A/2.303RT the values can be divided by balancing coefficient or not
  d.1 <- diagram(a, balance=1, plot.it=FALSE)
  d.CO2 <- diagram(a, plot.it=FALSE)
  expect_equal(as.numeric(d.CO2$plotvals), as.numeric(d.1$plotvals)/c(1, 1, 2, 2))
  # now run the calculation over a range of O2 
  basis("O2", -90)
  # 1-D
  a <- affinity(O2=c(-80, -70))
  # ask for the equilibrium activity of CO2
  expect_error(diagram(a, "CO2", groups=list(1:2, 3:4)), "can't plot equilibrium activities of basis species for grouped species")
  expect_error(diagram(a, "CO2", alpha=TRUE), "equilibrium activities of basis species not available with alpha=TRUE")
  d <- diagram(a, "CO2", plot.it=FALSE)
  # test that the result does in fact correspond to zero affinity of formation, how about for acetate?
  a <- affinity(O2=d$vals[[1]], CO2=d$plotvals[[4]])
  expect_equal(a$values[[4]], array(numeric(128)))
})

test_that("'groups' and 'alpha' work as expected", {
  basis("CHNOS+")
  species(c("formic acid", "formate", "acetic acid", "acetate"))
  # 1-D
  a <- affinity(O2=c(-80, -60))
  e <- equilibrate(a)
  # group the species together
  d <- diagram(e, groups=list(1:2, 3:4), plot.it=FALSE)
  # we should find that their activities have been multiplied by the balance coefficients and summed
  n.balance <- balance(a)$n.balance
  expect_equal(d$plotvals[[1]], log10(n.balance[1]*10^e$loga.equil[[1]] + n.balance[2]*10^e$loga.equil[[2]]))
  expect_equal(d$plotvals[[2]], log10(n.balance[3]*10^e$loga.equil[[3]] + n.balance[4]*10^e$loga.equil[[4]]))
  # ask for degrees of formation instead of logarithms of activities
  d <- diagram(e, alpha=TRUE, plot.it=FALSE)
  # we should find that the sum of alphas is one
  expect_equal(Reduce("+", d$plotvals), array(rep(1, 128)), check.attributes=FALSE)
})

test_that("'normalize' and 'as.residue' work as expected", {
  basis("CHNOS")
  species(c("LYSC_CHICK", "MYG_PHYCA", "RNAS1_BOVIN", "CYC_BOVIN"))
  # 1-D
  a <- affinity(O2=c(-80, -70))
  expect_error(diagram(a, normalize=TRUE), "can be TRUE only for a 2-D \\(predominance\\) diagram")
  # 2-D
  a <- affinity(H2O=c(-10, 0), O2=c(-80, -70))
  d1 <- diagram(a, normalize=TRUE, plot.it=FALSE)
  e <- equilibrate(a, normalize=TRUE)
  d2 <- diagram(e, plot.it=FALSE)
  expect_equal(d1$predominant, d2$predominant)
  expect_error(diagram(e, normalize=TRUE), "can be TRUE only if 'eout' is the output from affinity\\(\\)")
  d3 <- diagram(a, as.residue=TRUE, plot.it=FALSE)
  e <- equilibrate(a, as.residue=TRUE)
  d4 <- diagram(e, plot.it=FALSE)
  expect_equal(d3$predominant, d4$predominant)
})

test_that("diagram() handles 2D plots with different x and y resolution and warns for >1 species in contour plot", {
  basis("CHNOS")
  species(c("alanine", "glycine", "serine", "methionine"))
  a <- affinity(T=c(0, 200, 6), O2=c(-90, -60, 5))
  # now the warning is invokes next to the actual plotting, so no warning is produced with plot.it=FALSE 20180315
  #expect_warning(diagram(a, type="CO2", plot.it=FALSE), "showing only first species in 2-D property diagram")
})

test_that("NaN values from equilibrate() are preserved (as NA in predominance calculation)", {
  # example provided by Grayson Boyer 20170411
  basis(c("H2", "O2", "CO2"), c(-7.19, -60, -2.65))
  species(c("n-hexadecanol", "n-hexadecanoic acid", "n-octadecanol", "n-octadecanoic acid"), c("liq", "liq", "liq", "liq"))
  a <- affinity("H2" = c(-12, 0), "O2" = c(-90, -50), T=30)
  e <- equilibrate(a, balance = 1)
  d <- diagram(e, plot.it = FALSE)
  # equilibrate() here with default "boltzmann" method produces
  # NaN at very high O2 + low H2 or very low O2 + high H2 
  expect_equal(d$predominant[1, 128], as.numeric(NA))
  expect_equal(d$predominant[128, 1], as.numeric(NA))
})

## add the test but exclude it for now because plot.it=FALSE doesn't produce values for namesx 20190223
#test_that("labels are dropped outside of xlim and ylim ranges", {
#  basis(c("Fe", "O2", "S2"))
#  species(c("iron", "ferrous-oxide", "magnetite",
#    "hematite", "pyrite", "pyrrhotite"))
#  a <- affinity(S2=c(-50, 0), O2=c(-90, -10), T=200)
#  # total range: all species are present
#  d <- diagram(a, fill="heat", xlim=NULL, ylim=NULL, plot.it=FALSE)
#  expect_equal(sum(is.na(d$namesx)), 0)
#  # reduce y-range to exclude hematite
#  d <- diagram(a, fill="heat", xlim=NULL, ylim=c(-90, -50), plot.it=FALSE)
#  expect_equal(sum(is.na(d$namesx)), 1)
#  # reduce x-range to exclude pyrite
#  d <- diagram(a, fill="heat", xlim=c(-50, -20), ylim=c(-90, -50), plot.it=FALSE)
#  expect_equal(sum(is.na(d$namesx)), 2)
#})
