library(LICORS)


### Name: estimate_LC_pdfs
### Title: Estimate PLC/FLC distributions for all states
### Aliases: estimate_LC_pdfs estimate_LC_pdf_state estimate_LC.pdf.state
### Keywords: distribution multivariate nonparametric

### ** Examples

set.seed(10)
WW <- matrix(runif(10000), ncol = 10)
WW <- normalize(WW)
temp_flcs <- cbind(sort(rnorm(nrow(WW))))
temp_flc_pdfs <- estimate_LC_pdfs(temp_flcs, WW)
matplot(temp_flcs, temp_flc_pdfs, col = 1:ncol(WW), type = "l", xlab = "FLCs", 
    ylab = "pdf", lty = 1)
###################### one state only ###
temp_flcs <- temp_flcs[order(temp_flcs)]
temp_flc_pdf <- estimate_LC_pdf_state(state = 3, LCs = temp_flcs, weights = WW)

plot(temp_flcs, temp_flc_pdf, type = "l", xlab = "FLC", ylab = "pdf")



