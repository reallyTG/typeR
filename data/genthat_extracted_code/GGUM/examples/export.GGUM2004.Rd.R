library(GGUM)


### Name: export.GGUM2004
### Title: Exports data in 'GGUM2004' friendly format
### Aliases: export.GGUM2004

### ** Examples

# Generate data:
C   <- c(3, 3, 3, 5, 5, 5)
I   <- 6
gen <- GenData.GGUM(750, I, C, seed = 125)
# Export data to 'GGUM2004':
export.GGUM2004(gen$data)




