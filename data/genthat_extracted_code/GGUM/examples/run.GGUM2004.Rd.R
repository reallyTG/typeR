library(GGUM)


### Name: run.GGUM2004
### Title: Call 'GGUM2004' and import the estimated parameters into R
### Aliases: run.GGUM2004

### ** Examples

## Not run: 
##D # Generate data:
##D C   <- c(3, 3, 3, 5, 5, 5)
##D I   <- 6
##D gen <- GenData.GGUM(750, I, C, seed = 125)
##D # Export data to 'GGUM2004':
##D export.GGUM2004(gen$data)
##D # Write command file:
##D write.GGUM2004(I, C, model = "GGUM")
##D # Run 'GGUM2004':
##D res.GGUM2004 <- run.GGUM2004()
## End(Not run)



