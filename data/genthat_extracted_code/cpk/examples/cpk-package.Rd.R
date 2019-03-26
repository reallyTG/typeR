library(cpk)


### Name: cpk-package
### Title: Clinical Pharmacokinetics.
### Aliases: cpk-package cpk
### Keywords: cpk package

### ** Examples


wtkg = 181;       # kg

# Drug Disposition Parameters
thalf = 4;        # h
ke    = 0.3180;   # h^-1
vd    = 4.5;      # L/kg
cl    = 1.43;     # L/h/kg
f     = 1.00;     # dpo range: 15-64% (avg 38%), IV f = 1.

#### Set TTC
ttc = 25;

#### Calculate dose rate (mg/h)
dr  <- dr.fn (ttc, cl, wtkg, f)

#### Set dosing interval based on thalf
di = 4;   # h

#### Calculate dose (if f = 1, dose IV)
dpo <- dpo.fn (dr, di)
dpo/1000 # convert to mg

#### Calculate loading dose based on cmax
cmax <- 18.93; vd <- 35;
dlcmax <- dlcmax.fn(cmax, vd)

#### Calculate loading dose based on ar
dm <- 276; ar <- 2.4;
dlar <- dlar.fn(dm, ar)

#------------------------------------
# ANALYSIS
#------------------------------------
bc.ttc <- bc.ttc.fn (dr, f, cl, wtkg)

#### predict avg steady-state concentration
# accumulation ratio
ar  <- ar.fn (ke, di)

css <- css.fn (f, dpo, di, cl, ar, wtkg)
css # mg/L

# predict fluctuation about steady-state (ug/L)
cmax <- cmax.fn (f, dpo, vd, ar, wtkg)
cmin <- cmin.fn (cmax, ke, di)

ct <- ct.fn(cmax, ke, time=0)
ct <- ct.fn(cmax, ke, time=4)

# infusion rate
css <- 14.43; cl <- 3.2; 
R0  <- R0.fn(css, cl)




