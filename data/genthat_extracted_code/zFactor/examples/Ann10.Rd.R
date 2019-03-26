library(zFactor)


### Name: z.Ann10
### Title: Artificial Neural Network correlation
### Aliases: z.Ann10

### ** Examples

# calculate a single z point
ppr <- 1.5
tpr <- 2.0
z.calc <- z.Ann10(pres.pr = ppr, temp.pr = tpr)
## calculate z for multiple Ppr and Tpr
ppr <- c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
tpr <- c(1.05, 1.1, 1.7, 2)
z.calc <- z.Ann10(ppr, tpr)



