library(zFactor)


### Name: z.DranchukAbuKassem
### Title: Dranchuk-AbouKassem correlation
### Aliases: z.DranchukAbuKassem

### ** Examples

## calculate z for one Tpr curve at a single Ppr
z.DranchukAbuKassem(pres.pr = 1.5, temp.pr = 2.0)
## For vectors of Ppr and Tpr:
ppr <- c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
tpr <- c(1.3, 1.5, 1.7, 2)
z.DranchukAbuKassem(pres.pr = ppr, temp.pr = tpr)
## create and print comparison tables with the z matrices
ppr <- c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
tpr <- c(1.05, 1.1, 1.7, 2)
z.calc <- z.DranchukAbuKassem(ppr, tpr)
z.chart <- getStandingKatzMatrix(ppr_vector = ppr, tpr_vector = tpr)
ape <- abs((z.calc - z.chart) / z.chart) * 100
cat("z.correlation \n"); print(z.calc)
cat("\n z.chart \n"); print(z.chart)
cat("\n APE \n"); print(ape)



