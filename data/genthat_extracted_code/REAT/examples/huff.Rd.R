library(REAT)


### Name: huff
### Title: Huff model
### Aliases: huff

### ** Examples

# Example from Levy/Weitz (2009):

# Data for the existing and the new location
locations <- c("Existing Store", "New Store")
S_j <- c(5000, 10000)
location_data <- data.frame(locations, S_j)

# Data for the two communities (Rock Creek and Oak Hammock)
communities <- c("Rock Creek", "Oak Hammock")
C_i <- c(5000000, 3000000)
community_data <- data.frame(communities, C_i)

# Combining location and submarket data in the interaction matrix
interactionmatrix <- merge (communities, location_data)
# Adding driving time:
interactionmatrix[1,4] <- 10
interactionmatrix[2,4] <- 5
interactionmatrix[3,4] <- 5
interactionmatrix[4,4] <- 15
colnames(interactionmatrix) <- c("communities", "locations", "S_j", "d_ij")

huff_shares <- huff(interactionmatrix, "communities", "locations", "S_j", "d_ij")
huff_shares
# Market shares of the new location:
huff_shares$ijmatrix[huff_shares$ijmatrix$locations == "New Store",]


huff_all <- huff(interactionmatrix, "communities", "locations", "S_j", "d_ij",
localmarket_dataset = community_data, origin_id = "communities", localmarket = "C_i")

huff_all

huff_all$totals



