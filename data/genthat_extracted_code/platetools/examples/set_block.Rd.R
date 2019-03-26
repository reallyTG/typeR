library(platetools)


### Name: set_block
### Title: Set values in rectangular areas of a plate
### Aliases: set_block

### ** Examples

p <- data.frame(well = num_to_well(1:96))
head(p)

p <- set_block(p, c("A01~B02", "A05~D05"), "dNTP", 0.25)
p <- set_block(p,   "A03",                 "dNTP", 0.50)
head(p)

# Be careful with the column names
p <- set_block(p, "A01~H12", "Mg2+", 3.0)
head(p)

## Not run: 
##D # Chained updates with magrittr
##D p %<>%
##D   setBlock("A01~C04", "dNTP", 0.5) %>%
##D   setBlock("A01~C04", "Mg",   3.0)
## End(Not run)




