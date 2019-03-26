library(fwdmsa)


### Name: fs.MSA
### Title: Forward Search for Mokken Scale Analysis
### Aliases: fs.MSA
### Keywords: univar

### ** Examples

# Retrieve data (588 observations)
  data(acs)

# Run Forward Search for Mokken scale analysis starting with
# 550 observations in the initial subsample size to save time
  fwdmsa.res <- fs.MSA(acs, initial.subsample.size=550)

# Plot the objective function
  plot(fwdmsa.res, xlim = c(540,588))

# Plot the objective function for observations 1, 2, and 4
  plot(fwdmsa.res, id.observation = c(1,2,4), add=TRUE, col=2, xlim = c(540,588))

# Gap plot for subsamples 570 through 588
  plot(fwdmsa.res, type = "gap", ylim = c(0,4), xlim = c(570,588))

# Follow-up plots
  plot(fwdmsa.res, type="followup", step=560:565, reference.step=560, xlim = c(540,588))

# Min-excl plot.
  plot(fwdmsa.res, type = "minexcl", n2=TRUE, xlim=c(540,588))

# Plot of number of scales
  plot(fwdmsa.res, type="num.scale", n2=TRUE, xlim=c(540,588))

# Item entry plot for the longest scale
  plot(fwdmsa.res, type="scale", id.scale=1, n2=TRUE, xlim=c(540,588))

# Plot of estimated IRF of item 1
  plot(fwdmsa.res, type="IRF", items=1, n2=TRUE, xlim=c(540,588))

# Plot of coefH
  plot(fwdmsa.res, type="coefH", n2=TRUE, ylim=c(.1,.8), xlim=c(540,588))



