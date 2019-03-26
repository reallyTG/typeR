library(zFactor)


### Name: z.BeggsBrill
### Title: Beggs and Brill correlation
### Aliases: z.BeggsBrill

### ** Examples

## one single z calculation
z.BeggsBrill(pres.pr = 1.5, temp.pr = 2.0)
## calculate z for multiple values of Tpr and Ppr
ppr <- c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
tpr <- c(1.3, 1.5, 1.7, 2)
z.BeggsBrill(pres.pr = ppr, temp.pr = tpr)



