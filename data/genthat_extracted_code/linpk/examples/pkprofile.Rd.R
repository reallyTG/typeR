library(linpk)


### Name: pkprofile
### Title: Generate a concentration-time profile.
### Aliases: pkprofile pkprofile.default pkprofile.matrix

### ** Examples

# Default values, a bolus injection
y <- pkprofile()
plot(y)

t.obs <- seq(0, 24, 0.1)
dur <- 1
amt <- 1
ka <- 1
cl <- 0.25
vc <- 5
q <- 2.5
vp <- 10

# One-compartment model with first-order absorption, single dose
y <- pkprofile(t.obs, cl=cl, vc=vc, ka=ka, dose=list(amt=amt))
plot(y)

# Two-compartment model with first-order absorption, single dose
y <- pkprofile(t.obs, cl=cl, vc=vc, vp=vp, q=q, ka=ka, dose=list(amt=amt))
plot(y)

# One-compartment model with zero-order infusion, single dose
y <- pkprofile(t.obs, cl=cl, vc=vc, dose=list(dur=dur, amt=amt))
plot(y)

# Two-compartment model with zero-order infusion, single dose
y <- pkprofile(t.obs, cl=cl, vc=vc, vp=vp, q=q, dose=list(dur=dur, amt=amt))
plot(y)

# Two-compartment model with bolus injection, single dose
y <- pkprofile(t.obs, cl=cl, vc=vc, vp=vp, q=q, dose=list(amt=amt))
plot(y)

# Two-compartment model with bolus injection into the peripheral compartment, single dose
y <- pkprofile(t.obs, cl=cl, vc=vc, vp=vp, q=q, dose=list(amt=amt, cmt=2))
plot(y)

# Two-compartment model with zero-order infusion into the peripheral compartment, single dose
y <- pkprofile(t.obs, cl=cl, vc=vc, vp=vp, q=q, dose=list(amt=amt, cmt=2, dur=dur))
plot(y)

t.obs <- seq(0, 24*6, 1)

# One-compartment model with first-order absorption, multiple doses
y <- pkprofile(t.obs, cl=cl, vc=vc, ka=ka, dose=list(t.dose=seq(0, 24*5, 12), amt=amt))
plot(y)

# One-compartment model with first-order absorption, multiple doses specified by addl and ii
y <- pkprofile(t.obs, cl=cl, vc=vc, ka=ka, dose=list(t.dose=0, amt=amt, addl=9, ii=12))
plot(y, type="b")
points(y, col="blue")

# One-compartment model with first-order absorption, multiple doses under steady-state conditions
yss <- pkprofile(t.obs, cl=cl, vc=vc, ka=ka, dose=list(t.dose=0, amt=amt, addl=9, ii=12, ss=1))
lines(yss, col="red")
points(yss, col="green")

# One-compartment model with zero-order infusion, multiple doses specified by addl and ii
y <- pkprofile(t.obs, cl=cl, vc=vc, dose=list(dur=dur, amt=amt, addl=9, ii=12))
plot(y, log="y")

# One-compartment model with zero-order infusion, multiple doses  under steady-state conditions
yss <- pkprofile(t.obs, cl=cl, vc=vc, dose=list(dur=dur, amt=amt, addl=9, ii=12, ss=1))
lines(yss, col="red")




