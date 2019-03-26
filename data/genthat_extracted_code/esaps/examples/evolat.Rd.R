library(esaps)


### Name: evolat
### Title: Electoral volatility calculation
### Aliases: evolat

### ** Examples

votes <- list(data.frame(country = rep("ARG", 3),
                         year = c(1995, 2000, 2005),
                         party_A = c(40,10,20),
                         party_B = c(35,20,40),
                         party_C = c(25,70,40)),
              data.frame(country = rep("URY", 4),
                         year = c(1995, 2000, 2005, 2010),
                         party_A = c(30,30,20,20),
                         party_B = c(30,50,40, 30),
                         party_C = c(30,10,30, 25),
                         party_D = c(10,10,10,25)),
              data.frame(country = rep("BRA", 2),
                         year = c(1993, 1998),
                         party_A = c(30, 55),
                         party_B = c(70, 45)))

votes <- esaps_object(dataset = votes, name.country = "country", name.year = "year")
volatility <- evolat(esapsObject = votes, method = "Pedersen", summary = TRUE)



