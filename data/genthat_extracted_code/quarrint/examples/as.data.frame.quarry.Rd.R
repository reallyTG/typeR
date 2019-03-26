library(quarrint)


### Name: as.data.frame.quarry
### Title: Coerce a Quarry to a Data Frame
### Aliases: as.data.frame.quarry
### Keywords: data manip

### ** Examples

# creating a quarry
q <- quarry(geological.context = 2, hydrogeological.context = 4,
            piezometric.context = 1, quarry.position = 4,
            production.catchment = 4, quality.catchment = 3)

# coercing to a data frame
q.df <- as.data.frame(q)

# coercing to a data frame, keeping only "H1", "Z1" and "C2"
q.df.subset <- as.data.frame(q, attr = c("H1","Z1","C2"))



