library(mosaic)


### Name: bargraph
### Title: Create bar graphs from raw data
### Aliases: bargraph

### ** Examples

if (require(mosaicData)) {
data(HELPrct)
bargraph( ~ substance, data = HELPrct)
bargraph( ~ substance, data = HELPrct, horizontal = TRUE)
bargraph( ~ substance | sex, groups = homeless, auto.key = TRUE, data = HELPrct)
bargraph( ~ substance, groups = homeless, auto.key=TRUE, 
            data = HELPrct %>% filter(sex == "male"))
HELPrct2 <- mutate(HELPrct, older = age > 40)
bargraph( ~ substance | older, data = HELPrct2)
}



