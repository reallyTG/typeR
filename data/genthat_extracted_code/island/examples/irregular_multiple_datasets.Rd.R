library(island)


### Name: irregular_multiple_datasets
### Title: c/e rates for irregular samplings in multiple datasets
### Aliases: irregular_multiple_datasets NLL_imd

### ** Examples

irregular_multiple_datasets(simberloff, list(3:17, 3:18, 3:17,
3:19, 3:17, 3:16), 0.001, 0.001)
## Not run: 
##D irregular_multiple_datasets(simberloff, list(3:17, 3:18, 3:17, 3:19, 3:17,
##D  3:16), 0.001, 0.001, "Tax. Unit 1", n = 13)
##D irregular_multiple_datasets(simberloff, list(3:17, 3:18, 3:17, 3:19, 3:17,
##D  3:16), 0.001, 0.001, "Tax. Unit 1", n = 13, CI = TRUE)
##D  
## End(Not run)
 NLL_imd(simberloff, list(3:17, 3:18, 3:17, 3:19, 3:17, 3:16), 0.0051, 0.0117)



