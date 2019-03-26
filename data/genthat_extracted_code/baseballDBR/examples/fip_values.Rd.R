library(baseballDBR)


### Name: fip_values
### Title: Return FIP constants per season
### Aliases: fip_values
### Keywords: average, base fangraphs on wOBA, woba,

### ** Examples


data("Pitching2016")
head(Pitching2016)

fip_df <- fip_values(Pitching2016, Fangraphs=FALSE)
head(fip_df)





