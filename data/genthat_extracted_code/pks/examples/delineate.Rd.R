library(pks)


### Name: delineate
### Title: Delineate a Knowledge Structure by a Skill Function
### Aliases: delineate
### Keywords: models

### ** Examples

# Skill function
# mu(e) = {{s, t}, {s, u}},  mu(f) = {{u}}
# mu(g) = {{s}, {t}},        mu(h) = {{t}}
sf <- read.table(header = TRUE, text = "
item s t u
   e 1 1 0
   e 1 0 1
   f 0 0 1
   g 1 0 0
   g 0 1 0
   h 0 1 0
")
delineate(sf)

## See ?probability for further examples.



