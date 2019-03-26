library(gsw)


### Name: gsw_SP_from_SK
### Title: Calculate Practical Salinity from Knudsen Salinity
### Aliases: gsw_SP_from_SK

### ** Examples

SK <- c(34.5487, 34.7275, 34.8605, 34.6810, 34.5680, 34.5600)
SP <- gsw_SP_from_SK(SK)
expect_equal(SP, c(34.548342096952908, 34.727295637119113, 34.860409847645435,
                   34.680755706371187, 34.567658670360110, 34.559651800554022))



