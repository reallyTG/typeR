library(dpcR)


### Name: create_dpcr
### Title: Create dpcR object
### Aliases: create_dpcr
### Keywords: adPCR ddPCR

### ** Examples


# Droplet digital PCR example
sample_runs <- matrix(rpois(60, lambda = 1.5), ncol = 2)
ddpcr1 <- create_dpcr(sample_runs[,1], n = 30L, 
threshold = 1, type = "nm", adpcr = FALSE)
ddpcr2 <- create_dpcr(sample_runs[,2], n = 30L, 
threshold = 1, type = "nm", adpcr = FALSE)
plot_vic_fam(ddpcr1, ddpcr2)

# Array digital PCR example
sample_adpcr <- create_dpcr(rpois(765, lambda = 0.8), n = 765L, 
			    type = "nm", adpcr = TRUE)
plot_panel(sample_adpcr, 45, 17)




