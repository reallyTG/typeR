library(BTYD)


### Name: pnbd.Plot.DERT
### Title: Pareto/NBD Plot Discounted Expected Residual Transactions
### Aliases: pnbd.Plot.DERT

### ** Examples

# The RFM and CLV paper uses all 78 weeks of the cdnow data to
# estimate parameters. These parameters can be estimated as follows:

# elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3)
# cal.cbs <- dc.ElogToCbsCbt(elog)$cal$cbs
# pnbd.EstimateParameters(cal.cbs)
# (The final function was run several times with its own output as
# input for starting parameters, to ensure that the result converged).

params <- c(0.5629966, 12.5590370, 0.4081095, 10.5148048)

# 15% compounded annually has been converted to 0.0027 compounded continously,
# as we are dealing with weekly data and not annual data.
d <- 0.0027

pnbd.Plot.DERT(params, x=0:14, t.x=0:77, T.cal=77.86, d, type="persp")
pnbd.Plot.DERT(params, x=0:14, t.x=0:77, T.cal=77.86, d, type="contour")



