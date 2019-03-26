library(zFactor)


### Name: z.Papp
### Title: Papp correlation
### Aliases: z.Papp

### ** Examples

# Example 1
## one single z calculation
z.Papp(pres.pr = 1.5, temp.pr = 2.0)
# Example 2
## calculate z for multiple values of Tpr and Ppr
ppr <- c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
tpr <- c(1.3, 1.5, 1.7, 2)
z.Papp(pres.pr = ppr, temp.pr = tpr)



