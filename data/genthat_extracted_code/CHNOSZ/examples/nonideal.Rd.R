library(CHNOSZ)


### Name: nonideal
### Title: Activity coefficients of aqueous species
### Aliases: nonideal Bdot

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
### Examples following Alberty, 2003
### (page numbers given below)

## the default method setting is Helgeson;
## change it to Alberty
oldnon <- nonideal("Alberty")

## using nonideal() directly
# p. 273-276: activity coefficient (gamma)
# as a function of ionic strength and temperature
IS <- seq(0, 0.25, 0.005)
T <- c(0, 25, 40)
lty <- 1:3
species <- c("H2PO4-", "HADP-2", "HATP-3", "ATP-4")
col <- rainbow(4)
thermo.plot.new(xlim = range(IS), ylim = c(0, 1),
  xlab = axis.label("IS"), ylab = "gamma")
for(j in 1:3) {
  # use subcrt to generate speciesprops
  speciesprops <- subcrt(species, T = rep(T[j], length(IS)))$out
  # use nonideal to calculate loggamma; this also adjusts G, H, S, Cp,
  # but we don't use them here
  nonidealprops <- nonideal(species, speciesprops, IS = IS, T = convert(T[j], "K"))
  for(i in 1:4) lines(IS, 10^(nonidealprops[[i]]$loggam), lty=lty[j], col=col[i])
}
t1 <- "Activity coefficient (gamma) of -1,-2,-3,-4 charged species"
t2 <- quote("at 0, 25, and 40 "*degree*"C, after Alberty, 2003")
mtitle(as.expression(c(t1, t2)))
legend("topright", lty=c(NA, 1:3), bty="n",
  legend=c(as.expression(axis.label("T")), 0, 25, 40))
legend("top", lty=1, col=col, bty="n",
  legend = as.expression(lapply(species, expr.species)))

## more often, the 'IS' argument of subcrt() is used to compute
## adjusted properties at given ionic strength
# p. 16 Table 1.3: adjusted pKa of acetic acid
# set ideal.H to FALSE to calculate activity coefficients for the proton
# (makes for better replication of the values in Alberty's book)
thermo$opt$ideal.H <<- FALSE
(sres <- subcrt(c("acetate", "H+", "acetic acid"), c(-1, -1, 1),
  IS=c(0, 0.1, 0.25), T=25, property="logK"))
# we're within 0.01 log of Alberty's pK values
Alberty_logK <- c(4.75, 4.54, 4.47)
stopifnot(maxdiff(sres$out$logK, Alberty_logK) < 0.01)
# reset option to default
thermo$opt$ideal.H <<- TRUE

### An example using IS with affinity():
## speciation of phosphate as a function of ionic strength
opar <- par(mfrow=c(2, 1))
basis("CHNOPS+")
Ts <- c(25, 100)
species(c("PO4-3", "HPO4-2", "H2PO4-"))
for(T in Ts) {
  a <- affinity(IS=c(0, 0.14), T=T)
  e <- equilibrate(a)
  if(T==25) diagram(e, ylim=c(-3.0, -2.6), legend.x=NULL)
  else diagram(e, ylim=c(-3.0, -2.6), add=TRUE, col="red")
}
title(main="Non-ideality model for phosphate species")
dp <- describe.property(c("pH", "T", "T"), c(7, Ts))
legend("topright", lty=c(NA, 1, 1), col=c(NA, "black", "red"), legend=dp)
text(0.07, -2.76, expr.species("HPO4-2"))
text(0.07, -2.90, expr.species("H2PO4-"))
## phosphate predominance f(IS,pH)
a <- affinity(IS=c(0, 0.14), pH=c(6, 13), T=Ts[1])
d <- diagram(a, fill=NULL)
a <- affinity(IS=c(0, 0.14), pH=c(6, 13), T=Ts[2])
d <- diagram(a, add=TRUE, names=NULL, col="red")
par(opar)


### finished with Alberty equation, let's look at Helgeson
# this is the default setting, but is needed here because
# we set "Alberty" above
nonideal(oldnon) # same as nonideal("Helgeson")

## activity coefficients for monovalent ions at 700 degC, 10 kbar
# after Manning, 2010, Fig. 7
IS <- c(0.001, 0.01, 0.1, 1, 2, 2.79)
# we're above 5000 bar, so need to use IAPWS-95 or DEW
oldwat <- water("DEW")
wprop <- water(c("A_DH", "B_DH"), T=convert(700, "K"), P=10000)
water(oldwat)
# just use an empty table for a single species
speciesprops <- list(data.frame(G=rep(0, length(IS))))
# choose any monovalent species
(nonidealprops <- nonideal("Na+", speciesprops, IS=IS,
  T=convert(700, "K"), P=10000, A_DH=wprop$A_DH, B_DH=wprop$B_DH))
# we get the nonideal Gibbs energy contribution and
# the activity coefficient; check values of the latter
Manning_gamma <- c(0.93, 0.82, 0.65, 0.76, 1.28, 2)
gamma <- 10^nonidealprops[[1]]$loggam
# we're getting progressively further from his values with
# higher IS; not sure why
stopifnot(maxdiff(gamma[1], Manning_gamma[1]) < 0.01)
stopifnot(maxdiff(gamma, Manning_gamma) < 0.23)

## data and splines used for calculating B-dot
## (extended term parameter)
Bdot(showsplines = "T")
Bdot(showsplines = "P")



