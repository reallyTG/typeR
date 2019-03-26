library(GGUM)


### Name: GGUM-package
### Title: GGUM
### Aliases: GGUM-package _PACKAGE

### ** Examples

## Not run: 
##D # Example 1 - Same value C across items:
##D # Generate data:
##D gen1 <- GenData.GGUM(2000, 10, 2, seed = 125)
##D # Fit the GGUM:
##D fit1 <- GGUM(gen1$data, 2)
##D th1  <- Theta.EAP(fit1)
##D # Plot the test information function:
##D plotTIF(fit1, th1)
##D # Check model fit:
##D MOD.res <- MODFIT(fit1)
##D 
##D # Example 2 - Different C across items:
##D # Generate data:
##D set.seed(1); C <- sample(3:5, 10, replace = TRUE)
##D I <- 10
##D gen2 <- GenData.GGUM(2000, I, C, seed = 125)
##D # Fit the GGUM:
##D fit2 <- GGUM(gen2$data, C)
##D th2  <- Theta.EAP(fit2)
##D # Plot item information functions for items 1 and 3:
##D plotIIF(fit2, th2, items = c(1, 3))
##D 
##D # Example 3 - Fit GGUM using GGUM2004:
##D # Assuming the installation directory is C:/GGUM2004, then do this:
##D # Export data to GGUM2004:
##D export.GGUM2004(gen2$data)
##D # Write command file:
##D write.GGUM2004(I, C)
##D # Run GGUM2004:
##D res.GGUM2004 <- run.GGUM2004()
## End(Not run)



