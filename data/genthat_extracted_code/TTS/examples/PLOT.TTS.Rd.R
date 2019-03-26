library(TTS)


### Name: PLOT.TTS
### Title: Time-Temperature Superposition (TTS) plots
### Aliases: PLOT.TTS
### Keywords: TTS.PLOT()

### ** Examples

## TTS object applied to PC dataset.
data(PC)
Derive <- TTS(PC)
x <- Derive
## Generic plots for TTS analysis
PLOT <- PLOT.TTS(x)
names(PLOT)
##[1] "PLOT.data"  "PLOT.aT"   "PLOT.bT"   "PLOT.TTS.data"
##[5] "PLOT.TTS.gam"  "PLOT.res"
## Generic plots of: data, aT, bT, TTS.data, TTS.gam and res
PLOT$PLOT.data(main="PLOT: Data",xlab="log10.Frequency (rad/s)",
               ylab="log10.E'(Pa)")
PLOT$PLOT.aT(main="PLOT: horizontal translation factors",
               xlab="Temperature", ylab="aT")
PLOT$PLOT.bT(main="PLOT: vertical translation factors",
               xlab="Temperature",ylab="bT")
PLOT$PLOT.TTS.data(xlab="log10.Frequency (rad/s)",
               ylab="log10.E'(Pa)")
PLOT$PLOT.TTS.gam( xlab="log10.Frequency (rad/s)",
                ylab = "log10.E'(Pa)",
     main = "Fitted gam, Bootstrap confidence intervals",
     sub = "Reference temperature = 150 degrees celsius")
PLOT$PLOT.res(main="TTS: gam residual", xlab="Fitted",
                 ylab="Standardized residuals")



