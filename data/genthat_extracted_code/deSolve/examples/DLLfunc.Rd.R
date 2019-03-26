library(deSolve)


### Name: DLLfunc
### Title: Evaluates a Derivative Function Represented in a DLL
### Aliases: DLLfunc
### Keywords: utilities

### ** Examples

## ==========================================================================
## ex. 1
## ccl4model
## ==========================================================================
## Parameter values and initial conditions
## see example(ccl4model) for a more comprehensive implementation

Parms <- c(0.182, 4.0, 4.0, 0.08, 0.04, 0.74, 0.05, 0.15, 0.32,
        16.17, 281.48, 13.3, 16.17, 5.487, 153.8, 0.04321671,
        0.4027255, 1000, 0.02, 1.0, 3.8)

yini <- c(AI = 21, AAM = 0, AT = 0, AF = 0, AL = 0, CLT = 0,  AM = 0)

## the rate of change
DLLfunc(y = yini, dllname = "deSolve", func = "derivsccl4",
        initfunc = "initccl4", parms = Parms, times = 1,
        nout = 3, outnames = c("DOSE", "MASS", "CP")  )

## ==========================================================================
## ex. 2
## SCOC model, in fortran  - to see the FORTRAN code:
## ==========================================================================

## Forcing function "data"
Flux  <- matrix(ncol = 2, byrow = TRUE, data = c(1, 0.654, 2, 0.167))
parms <- c(k = 0.01)
Yini  <- 60

DLLfunc(y=Yini, times=1, func = "scocder",
    parms = parms, dllname = "deSolve",
    initforc = "scocforc",  forcings = Flux,
    initfunc = "scocpar", nout = 2,
    outnames = c("Mineralisation","Depo"))
## correct value = dy = flux - k * y = 0.654 - 0.01 * 60

DLLfunc(y = Yini, times = 2, func = "scocder",
    parms = parms, dllname = "deSolve",
    initforc = "scocforc",  forcings = Flux,
    initfunc = "scocpar", nout = 2,
    outnames = c("Mineralisation", "Depo"))



