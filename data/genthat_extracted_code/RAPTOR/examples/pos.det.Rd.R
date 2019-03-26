library(RAPTOR)


### Name: pos.det
### Title: Determining the cell position
### Aliases: pos.det

### ** Examples

## Not run: 
##D #example of position detection
##D input<-is.raptor(example.data(species="MOUNT_PINUS"), str = FALSE)
##D aligned<-align(input, list=c("h", "h", "h", 0.03), make.plot = FALSE)
##D first<-first.cell(aligned, frac.small = 0.2, yrs = FALSE, make.plot = FALSE)
##D output<-pos.det(first, swe = 0.7, sle = 3, ec = 1.75, swl = 0.5, sll = 5, lc = 10,
##D                 prof.co = 1.7, max.cells = 0.7, yrs = FALSE, aligning = FALSE, make.plot = TRUE)
## End(Not run)



